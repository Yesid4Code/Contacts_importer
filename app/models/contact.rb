class Contact < ApplicationRecord
  belongs_to :user

  def self.import(file, user)
    CSV.foreach(file.path, headers: true) do |row|
      contact_info = row.to_h
      contact = find_or_create_by!(name: contact_info['name'],
                                   date_of_birth: contact_info['date_of_birth'],
                                   phone: contact_info['phone'],
                                   address: contact_info['address'],
                                   credit_card: contact_info['credit_card'],
                                   franchise: contact_info['franchise'],
                                   email: contact_info['email'],
                                   user_id: user.id)
      contact.update(contact_info)
    end
  end

end
