class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: %i[accept reject edit update confirm_payment]
  def new
    @booking = Booking.new
    payment_methods = Stripe::Customer.list_sources(
      current_user.stripe_user_id,
      { object: 'card', limit: 3 }
    )
    @payment_method_exists = payment_methods.data.count.positive?

    # authorize @booking
  end

  # /costumes/:costume_id/bookings
  def create
    raise
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @instructor_package = InstructorPackage.find(params[:booking][:instructor_package_id])
    @booking.instructor_package = @instructor_package
    authorize @booking

    if params[:booking][:card_number]
      pm = Stripe::Customer.create_source(
        current_user.stripe_user_id,
        {
          source: 'tok_visa'
        }
      )
    end

    if @booking.save
      BookingMailer.with(booking: @booking).create_confirmation.deliver_now
      redirect_to confirm_payment_booking_path(@booking)
    else
      render "instructors/show"
    end
  end

  def confirm_payment
    authorize @booking
  end

  def edit
    authorize @booking
    @instructor = @booking.instructor
  end

  def update
    skip_policy_scope
    authorize @booking
    if @booking.update(booking_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def accept
    authorize @booking
    create_stripe_checkout
    @booking.status = "accepted"
    @booking.save
    redirect_to dashboard_path
  end

  def reject
    authorize @booking
    @booking.status = "rejected"
    @booking.save
    redirect_to dashboard_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:description, :instructor_package_id, :card_number, :exp_month, :exp_year, :cvv)
  end

  def create_stripe_checkout
    pm = Stripe::Customer.list_sources(
      @booking.user.stripe_user_id,
      { object: 'card', limit: 3 }
    )

    Stripe::Charge.create({
                            amount: (@booking.instructor_package.price * 100 * 0.15).to_i,
                            currency: 'usd',
                            source: 'tok_visa',
                            description: "#{@booking.instructor.user.first_name} #{@booking.instructor.user.last_name}"
                          })
  end
end
