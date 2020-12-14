class PaymentsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    authorize @booking, policy_class: PaymentPolicy
  end
end
