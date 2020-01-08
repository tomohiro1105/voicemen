class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #　アソシエーション 
  has_many :words
  
  # バリデーション
  validates :name, presence: true, length: { maximum: 10 }
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }, on: :create
  validates :password_confirmation, presence: true, on: :create
end
