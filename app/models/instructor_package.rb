class InstructorPackage < ApplicationRecord
  belongs_to :package
  belongs_to :instructor
  validates :price, presence: true
end
