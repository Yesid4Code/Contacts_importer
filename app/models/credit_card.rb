class CreditCard < ApplicationRecord
  require 'bcrypt'

  def initialize(credit_card)
    @credit_card = credit_card
  end

  def set_account_number
    @credit_card.last(4).to_s
  end
  
  def encrypted 
    BCrypt::Password.create(@credit_card)
  end

end
