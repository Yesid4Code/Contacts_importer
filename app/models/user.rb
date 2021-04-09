class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :contacts
  validates :email, email: true, uniqueness: true, length: { maximum: 25 }
end
