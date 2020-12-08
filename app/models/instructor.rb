class Instructor < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :locations, through: :instructor_locations
end
