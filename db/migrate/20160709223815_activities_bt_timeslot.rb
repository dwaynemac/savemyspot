class ActivitiesBtTimeslot < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :timeslot_id, :reference
  end
end
