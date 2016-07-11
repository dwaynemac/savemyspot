class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # removed :registerable to avoid sign up
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bookings

  def name
    email
  end
end
