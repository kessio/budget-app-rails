require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.create(name: 'Lilly', email: 'kessio@gmail.com', password: '234567') }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'Check email is present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
  it 'Check password is present' do
    subject.password = nil
    expect(subject).to_not be_valid
  end
end
