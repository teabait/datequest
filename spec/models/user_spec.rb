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

  describe "#new_quests" do
    it "only returns unaccepted and unrejected quests" do
      quest = FactoryGirl.create(:quest)
      remy = FactoryGirl.create(:user)
      daffodil = FactoryGirl.create(:user)
      quest.creator = remy.id
      quest.acceptor = daffodil.id
      quest.save
      expect(daffodil.new_quests.count).to eq(1)
    end
  end

  describe "#sent_quests" do
    it "only returns sent quests" do
      quest = FactoryGirl.create(:quest)
      remy = FactoryGirl.create(:user)
      daffodil = FactoryGirl.create(:user)
      quest.creator = remy.id
      quest.acceptor = daffodil.id
      quest.save
      expect(remy.sent_quests.count).to eq(1)
    end
  end

  describe "#upcoming_quests" do
    it "returns quests where users have accepted" do
      quest = FactoryGirl.create(:quest)
      remy = FactoryGirl.create(:user)
      daffodil = FactoryGirl.create(:user)
      quest.creator = remy.id
      quest.acceptor = daffodil.id
      quest.accept
      quest.save
      expect(daffodil.upcoming_quests.count).to eq(1)
    end
  end
end
