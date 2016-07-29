class Activity < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :room
  validates_presence_of :title
  validates_presence_of :activity_type

  belongs_to :teacher
  
  belongs_to :room
  validates_presence_of :room

  # un usuario no se puede inscribir a >1 activiy de un mismo timeslot
  belongs_to :timeslot

  has_many :bookings, dependent: :destroy

  has_attached_file :poster
  validates_attachment_content_type :poster, content_type: /\Aimage\/.*\Z/

  def limited_vacancies?
    !vacancies.nil?
  end

  def available_vacancies
    if limited_vacancies?
      vacancies - bookings.count
    end
  end
end
