class Package < ApplicationRecord
  has_many :instructors, through: :instructor_packages
  has_many :instructor_packages, dependent: :destroy
end
