require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'Validations' do
    before :each do
      @user = User.create(name: 'Sharon Kessio', email: 'kessio@gmail.com', password: '123456')
      @expense = Expense.new(author: @user, name: 'Wedding ring', amount: 200.0)
    end

    it 'Check expense is valid with valid attributes' do
      expect(@expense).to be_valid
    end

    it 'Expense is not valid without a name' do
      @expense.name = nil
      expect(@expense).to_not be_valid
    end

    it 'Expense is not valid without an amount' do
      @expense.amount = nil
      expect(@expense).to_not be_valid
    end

    it 'Checks expense has an amount that is a numeric data type' do
      expect(@expense.amount).to be_a_kind_of(Numeric)
    end

    it 'Checks expense is not valid without a user id' do
      @expense.author_id = nil
      expect(@expense).to_not be_valid
    end
  end
end
