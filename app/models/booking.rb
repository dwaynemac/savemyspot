class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validates_presence_of :user
  validates_presence_of :activity

  validates_uniqueness_of :user_id, scope: [:activity_id]

  validate :vacancies_available

  after_save :remove_other_bookings_on_timeslot
  #validate :one_spot_per_timslot

  private

  def remove_other_bookings_on_timeslot
    if activity 
      Booking.joins(:activity).where(activities: { timeslot_id: activity.timeslot_id}, user_id: user_id).where("bookings.id <> ?",id).destroy_all
    end
  end

  def one_spot_per_timslot
    if activity && Booking.joins(:activity).where(activities: { timeslot_id: activity.timeslot_id}, user_id: user_id).exists?
      self.errors.add(:base, :one_spot_per_timeslot)
    end
  end

  def vacancies_available
    if activity && activity.limited_vacancies?
      if activity.bookings.count >= activity.vacancies
        self.errors.add(:base, :no_vacancies_available)
      end
    end
  end

end
