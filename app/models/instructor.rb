class Instructor < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :locations, through: :instructor_locations
  has_many :languages, through: :instructor_languages
  has_many_attached :photos
  validates :description, presence: true
end
