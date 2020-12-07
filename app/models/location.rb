class Location < ApplicationRecord
  has_many :instructors, through: :instructor_locations
end
