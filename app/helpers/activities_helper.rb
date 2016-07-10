module ActivitiesHelper
  
  def col_width
    (12/@rooms.size).to_i
  end

  def activity_for(room,timeslot)
    @activities.select{|a| a.room_id == room.id && a.timeslot_id == timeslot.id }.first
  end

  def booking_for_activity(activity)
    @my_bookings.select{|b| b.activity_id == activity.id }.first
  end

  def booking_on_slot(timeslot)
    @my_bookings.select do |b|
      b.activity_id.in?(activities_for_timeslot(timeslot))
    end.first
  end

  def activities_for_timeslot(timeslot)
    @activities.select{|a| a.timeslot_id == timeslot.id }
  end
end
