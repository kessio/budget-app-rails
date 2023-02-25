require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'Sharon Kessio', email: 'kessio@gmail.com', password: '1234567') }
  let(:group) { described_class.new(author: user, name: 'Jewellery', icon: 'https://unsplash.com/photos/JZs-_xFIDV0') }

  describe 'validations' do
    it 'Checks User is valid' do
      expect(group).to be_valid
    end

    it 'Check Name is present' do
      group.name = nil
      expect(group).to_not be_valid
    end

    it 'Checks user id is present' do
      group.author_id = nil
      expect(group).to_not be_valid
    end

    it 'Checks icon is present' do
      group.icon = nil
      expect(group).to_not be_valid
    end
  end
end
