require 'rails_helper'

RSpec.describe Ability, type: :model do
 # pending "add some examples to (or delete) #{__FILE__}"

  require "cancan/matchers"

describe "User" do
  describe "abilities" do
    subject(:ability) { Ability.new(user) }
    let(:user) { nil }

    context "Create a group" do
      let(:user) { create(:group) }

      it { is_expected.to be_able_to(:manage, Group.new) }
    end
  end
end



end
