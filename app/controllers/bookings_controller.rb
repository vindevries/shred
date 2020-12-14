class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: %i[accept reject edit update confirm_payment]
  def new
    @booking = Booking.new
    # authorize @booking
  end

  # /costumes/:costume_id/bookings
  def create

    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @instructor_package = InstructorPackage.find(params[:booking][:instructor_package_id])
    @booking.instructor_package = @instructor_package
    authorize @booking

    if @booking.save
      redirect_to dashboard_path
    else
      render "instructors/show"
    end
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
    @booking.status = "accepted"
    @booking.save
    create_stripe_checkout
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
    params.require(:booking).permit(:description, :instructor_package_id)
  end

  def create_stripe_checkout
    session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          name: @booking.package.title,
          amount: @booking.price,
          currency: 'usd',
          quantity: 1
        }],
        success_url: root_url,
        cancel_url: root_url
      )
      @booking.update(checkout_session_id: session.id)
  end
end
