require 'spec_helper'

describe Challenge do
  describe "validations" do
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:rank) }

    let(:challenge) { FactoryGirl.create(:challenge)}
  end
end
