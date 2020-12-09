class ReviewsController < ApplicationController
  def new
    @booking = Booking.find_by(params[:booking_id])
    @user = current_user
    @review = Review.new
  end
end
