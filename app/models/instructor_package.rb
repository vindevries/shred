class InstructorPackage < ApplicationRecord
  belongs_to :package
  belongs_to :instructor
  has_one :booking, dependent: :destroy

  validates :price, presence: true

  # before_create :set_price
  # def set_price
  #   self.price = 0
  # end
end
