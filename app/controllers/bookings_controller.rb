class BookingsController < AuthorizedController
  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash.notice = t('.spot_saved')
    else
      flash.alert = t('.couldnt_save_spot')
    end
    redirect_to root_path
  end

  def destroy
    @booking = Booking.find(params[:id])

    unless @booking.destroy
      flash.alert = t('.couldnt_cancel')
    end

    redirect_to root_path
  end

  private

  def booking_params
    p = params.require(:booking).permit(:activity_id)
    p.merge({user_id: current_user.id})
  end
end
