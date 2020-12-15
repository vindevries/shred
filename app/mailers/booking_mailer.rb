class BookingMailer < ApplicationMailer
  def create_confirmation
    @booking = params[:booking]
    p @booking
    mail(
      to: @booking.instructor.user.email,
      subject: "New request. Visit our webpage to accept the booking!"
    )
  end
end
