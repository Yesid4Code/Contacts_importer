class CsvImport < ApplicationRecord
  include AASM
  belongs_to :user

  aasm column: "state" do
    state :waiting, initial: true
    state :processing
    state :failed
    state :finished

    
    event :process do
      transitions from: :waiting, to: :processing
    end

    event :finish do
      transitions from: :processing, to: :finished
    end

    event :reject do
      transitions from: :processing, to: :failed
    end
  end


  def import(file, user)
    records_failed = []
    CSV.foreach(file.path, headers: true) do |row|
      contact_info = row.to_h
      contact = Contact.new(
        name: contact_info['name'],
        date_of_birth: contact_info['date_of_birth'],
        phone: contact_info['phone'],
        address: contact_info['address'],
        credit_card: contact_info['credit_card'],
        franchise: CreditCardValidations::Detector.new(
          contact_info['credit_card']).brand_name,
        email: contact_info['email'],
        user_id: user.id,
        account_number: contact_info['credit_card'])

      if contact.save
        finish!
      else
        invalid_records = InvalidRecord.new(
          name: contact_info['name'],
          date_of_birth: contact_info['date_of_birth'],
          phone: contact_info['phone'],
          adress: contact_info['address'],
          credit_card: contact_info['credit_card'],
          franchise: CreditCardValidations::Detector.new(
            contact_info['credit_card']).brand_name,
          email: contact_info['email'],
          user_id: user.id,
          error_message: contact.errors.full_messages.join(', '))
        invalid_records.save
        reject!
      end #if
    end #csv
  end #method
end
