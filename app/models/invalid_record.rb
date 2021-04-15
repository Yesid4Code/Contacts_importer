class InvalidRecord < ApplicationRecord
  belongs_to :user

  validates :error_message, presence: true
  validate :set_last_digits

   def set_last_digits
    self.credit_card = CreditCard.new(credit_card).set_account_number
  end

end
