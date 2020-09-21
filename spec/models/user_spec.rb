require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do

    describe 'all 4 four fields are available' do
      it 'would save succssfully' do
        @user = User.new(first_name: 'xxx', last_name: 'yyy', email: 'test@test.com', password: '123456789', password_confirmation: '123456789')
        @user.save!
        expect(@user.id).to be_present
      end
    end
      
    describe '#first_name missing' do
      it 'generate an error' do
        @user = User.new(last_name: 'yyy', email: 'test@test.com', password: '123456789', password_confirmation: '123456789')
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages[0]).to eq("First name can't be blank")
      end
    end

    describe '#last_name missing' do
      it 'generate an error' do
        @user = User.new(first_name: 'yyy', email: 'test@test.com', password: '123456789', password_confirmation: '123456789')
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages[0]).to eq("Last name can't be blank")
      end
    end

    describe '#email' do
      describe '#email is missing' do
        it 'generate an error' do
          @user = User.new(first_name: 'xxx', last_name: 'yyy', password: '123456789', password_confirmation: '123456789')
          expect(@user).to_not be_valid
          expect(@user.errors.full_messages[0]).to eq("Email can't be blank")
        end
      end

      describe '#email is not unique' do
        it 'generate an error' do
          @user = User.new(first_name: 'xxx', last_name: 'yyy', email: 'test@test.com', password: '123456789', password_confirmation: '123456789')
          @user.save!
          @user2 = User.new(first_name: 'xxx2', last_name: 'yyy2', email: 'test@test.com', password: '1234567892', password_confirmation: '1234567892')
          expect(@user2).to_not be_valid
          expect(@user2.errors.full_messages).to include("Email has already been taken")
        end
      end

      describe '#email is not case sensitive' do
        it 'generate an error' do
          @user = User.new(first_name: 'xxx', last_name: 'yyy', email: 'test@test.com', password: '123456789', password_confirmation: '123456789')
          @user.save!
          @user2 = User.new(first_name: 'xxx2', last_name: 'yyy2', email: 'Test@test.com', password: '1234567892', password_confirmation: '1234567892')
          expect(@user2).to_not be_valid
          expect(@user2.errors.full_messages).to include("Email has already been taken")
        end
      end

    end
      
    describe '#password' do
      it 'generate an error' do
        @user = User.new(first_name: 'xxx', last_name: 'yyy', email: 'test@test.com', password_confirmation: '123456789')
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
    end

    describe '#password_confirmation' do
      it 'generate an error' do
        @user = User.new(first_name: 'xxx', last_name: 'yyy', email: 'test@test.com', password: '123456789')
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end
    end

    describe '#password_confirmation & #password' do
      it 'generate an error' do
        @user = User.new(first_name: 'xxx', last_name: 'yyy', email: 'test@test.com', password: '123456789', password_confirmation: '12345678910')
        expect(@user).to_not be_valid
        puts @user.errors.full_messages
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end

    
  end
end
