class ActivitiesController < AuthorizedController

  def index
    @timeslots = Timeslot.order(:start_at).all
    @rooms = Room.all
    @activities = Activity.all
    @my_bookings = Booking.where(user_id: current_user.id).all
  end
end
