class CsvImport < ApplicationRecord
  belongs_to :user

  def self.import(file, user)
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

      contact.save
      
      if contact.save
        done 
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
      end #if
    end #csv
  end #method
end
