class Package < ApplicationRecord
  has_many :instructors, through: :instructor_packages
end
