class Instructor < ApplicationRecord
  belongs_to :user
  has_many :locations, through: :instructor_locations
end
