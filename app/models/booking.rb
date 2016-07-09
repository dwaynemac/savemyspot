class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validate :vacancies_available

  def vacancies_available
    if activity.limited_vacancies?
      if activity.bookings.count > activity.vacancies
        self.errors.add(:base, :no_vacancies_available) # can add :message option
      end
    end
  end
end
