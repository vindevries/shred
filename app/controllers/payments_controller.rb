class PaymentsController < ApplicationController
  def new
    @order = Booking.find(params[:booking_id])
  end
end
