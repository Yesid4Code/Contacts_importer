class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :contacts
  has_many :csv_imports
  has_many :invalid_records
  
  validates :email, email: true, uniqueness: true, length: { maximum: 25 }
end
