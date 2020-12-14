class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :instructor_package
  has_one :package, through: :instructor_package
  has_one :review, dependent: :destroy
  validates :description, presence: true

  before_create :set_status, :set_price

  def set_status
    self.status = "pending"
  end

  def instructor
    instructor_package.instructor
  end

  private

  def set_price
    self.price = instructor_package.price
  end

end
