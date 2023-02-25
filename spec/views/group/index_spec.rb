require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
include Devise::Test::IntegrationHelpers
let(:user) { User.create(name: 'Lilly', email: 'kessio@gmail.com', password: '123456', password_confirmation: '123456', confirmed_at: Time.now) }

before :each do
  @category = Group.create(name: 'Transport', icon: 'transport.png', author_id: user.id)
end

context "when logged in" do
  before do
  login_as(user)
  visit root_path
end

it "displays category content" do
    expect(page).to have_content("Transport")
  end

  it "Leads to correct page when link is clicked" do
    click_link 'View' 
    expect(current_path).to eq(group_expenses_path(@category))
  end
end

end