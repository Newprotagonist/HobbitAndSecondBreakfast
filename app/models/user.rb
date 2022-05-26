class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :offer
  has_many :reservations
  has_many :reviews_as_receiver, class_name: "Review", foreign_key: :receiver_id
  has_many :reviews_as_giver, class_name: "Review", foreign_key: :giver_id
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true, uniqueness: { scope: :last_name }
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
end
