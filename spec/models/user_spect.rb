require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(email: 'Yesid@gmail.com', :password => '123456')}
  
  describe 'Relationship with Contact' do
    it { should have_many(:contacts) }
  end

  describe 'Credentials validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }

    context "when email is  unique" do
      before { described_class.create!(email: "Yesid@prueba.com", password: "123456") }
      it { expect(user).to be_valid }
    end
    
    context "when email is not unique" do
      let { (:user) { User.create(email: "lopera@prueba.com", password: "123456") }
      it { expect(user).to be_invalid }
    end
  end
end
