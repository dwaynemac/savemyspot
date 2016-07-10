class ActivitiesController < AuthorizedController

  def index
    @timeslots = Timeslot.order(:start_at).all
    @rooms = Room.all
    if params[:only_mine]
      @activities = Activity.joins(:bookings).where(bookings: { user_id: current_user.id }).all
    else
      @activities = Activity.all
    end
    @my_bookings = Booking.where(user_id: current_user.id).all
  end
end
