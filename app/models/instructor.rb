class Instructor < ApplicationRecord
  belongs_to :user
  has_many :locations, through: :instructor_locations
  validates :description, presence: true
end
