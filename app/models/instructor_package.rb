class InstructorPackage < ApplicationRecord
  belongs_to :package
  belongs_to :instructor
end
