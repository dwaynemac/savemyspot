class Activity < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :room
  validates_presence_of :title
  validates_presence_of :activity_type

  belongs_to :teacher
  
  belongs_to :room
  validates_presence_of :room
end
