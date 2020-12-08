class Instructor < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :instructor_locations
  has_many :instructor_languages
  has_many :instructor_packages
  has_many :locations, through: :instructor_locations
  has_many :languages, through: :instructor_languages
  has_many :packages, through: :instructor_packages
  has_many_attached :photos
  validates :description, presence: true

  def has_package?(package)
    InstructorPackage.find_by(instructor: self, package: package)
  end
end
