module ActivitiesHelper
  
  def col_width
    (12/@rooms.size).to_i
  end

  def activity_for(room,timeslot)
    @activities.select{|a| a.room_id == room.id && a.timeslot_id == timeslot.id }.first
  end
end
