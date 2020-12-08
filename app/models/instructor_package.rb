class InstructorPackage < ApplicationRecord
  belongs_to :package
  belongs_to :instructor
  before_create :set_price
  
  def set_price
    self.price = 0
  end
end
