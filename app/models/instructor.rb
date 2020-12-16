class Instructor < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :instructor_locations, dependent: :destroy
  has_many :instructor_languages, dependent: :destroy
  has_many :instructor_packages, dependent: :destroy
  has_many :bookings, through: :instructor_packages, source: :booking
  has_many :locations, through: :instructor_locations
  has_many :languages, through: :instructor_languages
  has_many :packages, through: :instructor_packages
  has_many :bookings, through: :instructor_packages
  has_many :reviews, through: :bookings
  has_many_attached :photos
  validates :description, presence: true
  validates :phone, format: { with: /\A\+(?:[0-9]●?){6,14}[0-9]\z/ }
  def average_rating
    if !reviews.empty?
      reviews.pluck(:rating).sum / reviews.size
    end
  end

  def has_package?(package)
    InstructorPackage.find_by(instructor: self, package: package)
  end
end
