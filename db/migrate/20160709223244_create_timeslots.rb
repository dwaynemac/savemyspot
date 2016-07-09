class CreateTimeslots < ActiveRecord::Migration[5.0]
  def change
    create_table :timeslots do |t|

      t.time :start_at
      t.time :end_at

      t.timestamps
    end
  end
end
