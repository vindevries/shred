class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @user = current_user
    @review = Review.new
    authorize @booking, policy_class: ReviewPolicy
  end

  def create
    skip_policy_scope
    @booking = Booking.find(params[:booking_id])
    authorize @booking, policy_class: ReviewPolicy
    @review = Review.new(review_params)
    @review.booking = @booking
    @review.user = current_user
    if @review.save
      redirect_to dashboard_path
    else
      flash[:alert] = "Something went wrong."
      render "new"
    end
  end


   def review_params
    params.require(:review).permit(:title, :description, :rating)
  end

end
