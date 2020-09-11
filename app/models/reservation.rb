class Reservation < ApplicationRecord
  belongs_to :player
  belongs_to :court

  validates :date, presence: true
  validate :limit_bookings

    def limit_bookings
        court = self.court
        if court.reservations.where("date like ?", self.date).count > court.number_of_courts
            errors.add(:date, "Sorry, all courts are already booked during this time. Please select another time")
        end
    end

end