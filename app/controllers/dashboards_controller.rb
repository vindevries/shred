class DashboardsController < ApplicationController
 before_action :authenticate_user!
    def dashboard
 

    # @instructor_pending_bookings = current_user.bookings.where(status: "pending")
    if current_user.instructor 
      @instructor_pending_bookings = Booking.joins(instructor_package: :instructor).where(instructors: {id: current_user.instructor.id})
    else
      @user_pending_bookings = current_user.bookings.where(status: "pending")
      @user_accepted_bookings = current_user.bookings.where(status: "accepted")
    end
    # @owner_bookings = current_user.costumes.map(&:bookings).flatten
    # @renter_completed_bookings = current_user.bookings.where(status: "accepted").where("end_date < ?", Date.today)
  end
end
