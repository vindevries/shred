class InstructorLocation < ApplicationRecord
  belongs_to :instructor
  belongs_to :location
  validates :instructor, uniqueness: {scope: :location}
end
