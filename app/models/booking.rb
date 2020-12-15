class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :instructor_package
  has_one :package, through: :instructor_package
  has_one :review, dependent: :destroy
  validates :description, presence: true
  attr_accessor :card_number
  attr_accessor :exp_month
  attr_accessor :exp_year
  attr_accessor :cvv
  

  before_create :set_status, :set_price
  after_create :send_message
  

  def send_message
    if ENV['RAILS_ENV'] == "production"
    Messages::CLIENT.message_create('MessageBird', "#{self.instructor.phone}", 'This is a test message', :reference => 'Foobar')
    end
  end

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
