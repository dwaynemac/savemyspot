class BookingsController < AuthorizedController
  def create
    Booking.create(booking_params)
    redirect_to activities_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to activities_path
  end

  private

  def booking_params
    p = params.require(:booking).permit(:activity_id)
    p.merge({user_id: current_user.id})
  end
end
