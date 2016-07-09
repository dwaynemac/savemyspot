class ActivitiesController < AuthorizedController

  def index
    @timeslots = Timeslot.order(:start_at).all
    @rooms = Room.all
    @activities = Activity.all
  end
end
