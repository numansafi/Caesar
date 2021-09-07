class Booking < ApplicationRecord
  belongs_to :venue
  belongs_to :user

  validates :number_of_people, :date, :time, presence: true
end
