require 'rails_helper'

RSpec.describe User, type: :model do
  
  subject {User.new(
    first_name: 'user1',
    last_name: 'test',
    email: 'abc@abc.com',
    password: '1',
    password_confirmation: '1'
  )}
  
  describe 'Validation' do
    it 'is not valid without password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end
  end

end


