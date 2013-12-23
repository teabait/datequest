require 'spec_helper'

describe Quest do
  before (:each) do
    @remy = FactoryGirl.create(:user)
    @quest = FactoryGirl.create(:quest)
  end
  describe "validations" do
    it { should validate_presence_of(:quest_date) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:creator) }
    it { should validate_presence_of(:acceptor) }
  end

  describe "#challenges" do
    it "has no challenges at the beginning" do
      expect(@quest.challenges.count).to eq(0)
    end
  end

  describe "#inviter" do
    it "finds inviter by id" do
      @quest = FactoryGirl.create(:quest, creator: @remy.id)
      expect(@quest.inviter).to eq(@remy)
    end
  end

  describe "#invitee" do
    it "finds invitee by id" do
      @quest = FactoryGirl.create(:quest, acceptor: @remy.id)
      expect(@quest.invitee).to eq(@remy)
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

  describe "#text_challenges" do
    before do
      @quest.assign_challenges(@remy)
    end
    it "sends a text to the users who are on a date" do
      expect(@quest.text_challenges).to have(0).errors
    end
  end

  describe "#accept" do
    it "changes accept to true and reject to false" do
      @quest.accept
      expect(@quest.accepted).to eq(true)
      expect(@quest.rejected).to eq(false)
    end
  end
  describe "#reject" do
    it "changes accept to false and reject to true" do
      @quest.reject
      expect(@quest.accepted).to eq(false)
      expect(@quest.rejected).to eq(true)
    end
  end

  describe "#end_challenge_window" do
    it "returns a time that is 5 hours later than the quest start" do
      expect(@quest.end_challenge_window).to eq("2013-12-18 20:36:00")
    end
  end
end
