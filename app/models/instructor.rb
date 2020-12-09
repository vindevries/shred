class Instructor < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :instructor_locations, dependent: :destroy
  has_many :instructor_languages, dependent: :destroy
  has_many :instructor_packages, dependent: :destroy
  has_many :locations, through: :instructor_locations
  has_many :languages, through: :instructor_languages
  has_many :packages, through: :instructor_packages
  has_many :bookings, through: :instructor_packages
  has_many :reviews, through: :bookings
  has_many_attached :photos
  validates :description, presence: true

  def has_package?(package)
    InstructorPackage.find_by(instructor: self, package: package)
  end
end
