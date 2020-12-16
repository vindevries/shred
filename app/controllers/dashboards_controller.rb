class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def dashboard
    # @instructor_pending_bookings = current_user.bookings.where(status: "pending")
    if current_user.instructor
      @instructor_pending_bookings = Booking.joins(instructor_package: :instructor).where(instructors: { id: current_user.instructor.id })
      @pending_bookings = @instructor_pending_bookings.where(status: "pending")
      @upcoming_bookings = @instructor_pending_bookings.where(status: "accepted", updated_at: (Date.today - 2.weeks)..Date.today + 1.day)
      @past_bookings = @instructor_pending_bookings.where("status = :rejected_status OR (status = :accepted_status AND bookings.updated_at <= :date)", rejected_status: "rejected", accepted_status: "accepted", date: Date.today - 2.weeks)
    else
      @user_pending_bookings = current_user.bookings.where(status: "pending")
      @user_accepted_bookings = current_user.bookings.where(status: "accepted")
    end
    # @owner_bookings = current_user.costumes.map(&:bookings).flatten
    # @renter_completed_bookings = current_user.bookings.where(status: "accepted").where("end_date < ?", Date.today)
  end
end
