class Contact < ApplicationRecord
  require 'bcrypt'
  belongs_to :user
  before_save :sanitize_text

  NAME_REGEX_VALID = /\A[a-zA-Z\s-]+\z/
  PHONE_REGEX_VALID = /\(\+\d{2}\)\s\d{3}\s\d{3}\s\d{2}\s\d{2}|\(\+\d{2}\)\s\d{3}\-\d{3}\-\d{2}\-\d{2}/
  
  validates_presence_of :name, :date_of_birth, :phone, :address,
                        :credit_card, :franchise, :email,
                        message: "can't be blank"
  
  validates :name,
            format: { with: NAME_REGEX_VALID,
                      message: 'Name with special character are not allowed, only "-" is allowed' }
  validate :valid_date_of_birth
  validates :phone,
            format: { with: PHONE_REGEX_VALID,
                      message: 'Please include de phone in the next formats: (+57) 320 432 05 09 or (+57) 320-432-05-09'}
  validates :email, email: true,
            uniqueness: { scope: :user_id, message: "You have a contact with the same email" }
  
  validate :set_last_digits
  after_validation :card_encrypted
  
  
  def valid_date_of_birth
    date = Date.iso8601(date_of_birth)
  rescue StandardError
    errors.add(:date_of_birth, 'Invalid format, it should be: YYYY-MM-DD or YYYYMMDD')
  end

  def set_last_digits
    self.account_number = CreditCard.new(account_number).set_account_number
  end

  def card_encrypted
    self.credit_card = CreditCard.new(credit_card).encrypted
  end

  def sanitize_text
    self.name = name.titleize
    self.email = email.downcase
  end

  
end
