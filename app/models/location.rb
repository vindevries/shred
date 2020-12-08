class Location < ApplicationRecord
  has_many :instructors, through: :instructor_locations
  validates :name, presence: true
end
