require 'spec_helper'

describe User do
  before (:each) do
    @remy = FactoryGirl.create(:user)
  end
  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:birthdate) }
    it { should have_secure_password }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:rank) }
  end
  describe "#level_up" do
    before do
      @remy.level_up
    end
    it "changes the users level" do
      expect(@remy.rank).to eq(1)
    end
    describe "#rank_name" do
      it "returns a title equivalent to the user rank" do
        expect(@remy.rank_name).to eq("cook")
      end
    end
  end
  describe "#age" do
    it "takes users birthdate and returns an age" do
      expect(@remy.age).to eq(23)
    end
  end
end
