class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :instructor_package
  has_one :review
  validates :description, presence: true
end
