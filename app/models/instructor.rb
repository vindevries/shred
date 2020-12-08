class Instructor < ApplicationRecord
  belongs_to :user
  has_many :locations, through: :instructor_locations
  has_many :languages, through: :instructor_languages
  validates :description, presence: true
end
