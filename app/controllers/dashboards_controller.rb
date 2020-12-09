class DashboardsController < ApplicationController
 before_action :authenticate_user!
    def dashboard
 

    # @instructor_pending_bookings = current_user.bookings.where(status: "pending")
    if current_user.instructor 
      @instructor_pending_bookings = current_user.instructor.bookings.where(status: "pending")
    else
      @user_pending_bookings = current_user.bookings.where(status: "pending")
    end
    # @owner_bookings = current_user.costumes.map(&:bookings).flatten
    # @renter_completed_bookings = current_user.bookings.where(status: "accepted").where("end_date < ?", Date.today)
  end
end
