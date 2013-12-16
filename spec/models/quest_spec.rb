require 'spec_helper'

describe Quest do
  before (:each) do
    @remy = FactoryGirl.create(:user)
    @quest = FactoryGirl.create(:quest)
  end
  describe "validations" do
    it { should validate_presence_of(:quest_date) }
    it { should validate_presence_of(:quest_time) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:creator) }
    it { should validate_presence_of(:acceptor) }
  end

  describe "challenges" do
    it "has no challenges at the beginning" do
      expect(@quest.challenges.count).to eq(0)
    end
  end

  describe "#assign_challenges" do
    before (:each) do
      100.times do FactoryGirl.create(:challenge) end
      @quest.assign_challenges(@remy)
      @quest.save
    end
    it "has exactly 3 challenges" do
      expect(@quest.challenges.count).to eq(3)
    end
    it "assigns challenges of the same rank as user" do
      expect(@quest.challenges[1].rank).to eq(@remy.rank)
      expect(@quest.challenges[2].rank).to eq(@remy.rank)
      expect(@quest.challenges[0].rank).to eq(@remy.rank)
    end
  end
end
