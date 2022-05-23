class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :offer
  has_many :reservation
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
