require 'rails_helper'

RSpec.describe Contact, type: :model do
  let(:user) { User.create(email: 'user1@gmail.com', :password => '123456')}
  
  describe 'Relationship with User' do
    it { should belong_to(:user) }
  end

  describe 'Header validations' do
      let(:contact) {
    Contact.new(
      name: 'Emma Crespo',
      date_of_birth: '1991-11-23',
      phone: '(+57) 300-345-45-54',
      address: 'Carrera 5 # 23 - 23, Cali',
      credit_card: '5568390844958312',
      franchise: 'Mastercard',
      email: 'yesid@lopez.com'
    )}

    it { should validate_presence_of(:name) }
    #it { should validate_presence_of(:) } #date_of birth
    #it { should validate_presence_of(:phone)
    #address
    #credit_card
    #franchise
    #email
  end
end
