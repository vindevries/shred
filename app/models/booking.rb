class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :instructor_package
  has_one :review, dependent: :destroy
  validates :description, presence: true
   
  before_create :set_status
  def set_status
    self.status = "pending"
  end
end
