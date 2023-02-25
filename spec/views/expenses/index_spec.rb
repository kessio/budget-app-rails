require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
include Devise::Test::IntegrationHelpers
let(:user) { User.create(name: 'Lilly', email: 'kessio@gmail.com', password: '123456', password_confirmation: '123456', confirmed_at: Time.now) }

before :each do
  @category = Group.create(name: 'Transport', icon: 'transport.png', author_id: user.id)
  @transaction = Expense.create(author: user, name: 'cake', amount: 100, groups: [@category])
end

context "when logged in" do
  before do
  login_as(user)
  visit root_path
  visit group_expenses_path(@category)
end
 it "Visit transaction page" do
    expect(page).to have_content 'cake'
 end

end


end