class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validates_presence_of :user
  validates_presence_of :activity

  validates_uniqueness_of :user_id, scope: [:activity_id]

  validate :vacancies_available

  def vacancies_available
    if activity && activity.limited_vacancies?
      if activity.bookings.count >= activity.vacancies
        self.errors.add(:base, :no_vacancies_available) # can add :message option
      end
    end
  end

end
