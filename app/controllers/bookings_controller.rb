class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: %i[accept reject]
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

  def accept
    # authorize @booking
    @booking.status = "accepted"
    @booking.save
    redirect_to dashboard_path
  end

  def reject
    # authorize @booking
    @booking.status = "rejected"
    @booking.save
    redirect_to dashboard_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:description, :status)
  end
end
