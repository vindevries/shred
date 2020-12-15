class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :instructor, dependent: :destroy
  has_many :bookings
  has_many :reviews, dependent: :destroy
  validates :first_name, presence: true

  def create_stripe_user
    customer = Stripe::Customer.create({
      email: "#{self.email}",
      name: "#{self.first_name} #{self.last_name}"
    })

    self.stripe_user_id = customer.id
    self.save
  end


end
