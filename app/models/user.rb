require 'authentication_token'

class User < ApplicationRecord

  include AuthenticationToken

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable
  #       :recoverable, :rememberable, :trackable, :validatable

  devise :database_authenticatable, :trackable


  has_many :bookings

  def name
    email
  end
end
