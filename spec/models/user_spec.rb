require 'rails_helper'

RSpec.describe User, type: :model do
  
  subject {User.new(
    first_name: 'user1',
    last_name: 'test',
    email: 'abc@abc.com',
    password: '123',
    password_confirmation: '123'
  )}
  
  describe 'Validation' do
    it 'is not valid without password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end
  
    it 'is not valid without password confirmation' do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without same password confirmation' do
      subject.password_confirmation = 3
      expect(subject).to_not be_valid
    end

    it 'is not valid without first name' do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without last name' do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is valid with valid values' do
      expect(subject).to be_valid
    end

    it 'is not valid if password less that 3 characters' do
      subject.password = "34"
      subject.password_confirmation = "34"
      expect(subject).to_not be_valid
    end

  end


  describe '.authenticate_with_credentials' do
    it 'returns the user if user exists' do
      subject.save
      @user = User.authenticate_with_credentials('abc@abc.com','123')
      expect(@user).to_not be_nil
    end

    it "returns nil if user doesn't exist" do
      subject.save
      @user = User.authenticate_with_credentials('example@example.com','password')
      expect(@user).to be_nil
    end

    it "returns the user even if there are trailing or leading spaces" do
      subject.save
      @user = User.authenticate_with_credentials('   abc@abc.com   ','123')
      expect(@user).to_not be_nil
    end

    it "returns the user with wrong case" do
      subject.save
      @user = User.authenticate_with_credentials('aBc@Abc.Com','123')
      expect(@user).to_not be_nil
    end
  end

 

end


