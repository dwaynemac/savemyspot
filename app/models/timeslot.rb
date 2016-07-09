class Timeslot < ApplicationRecord
  has_many :activities

  def name
    "#{start_at.to_formatted_s(:time)} - #{end_at.to_formatted_s(:time)}"
  end
end
