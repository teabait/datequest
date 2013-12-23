require 'spec_helper'

describe Message do
  before (:each) do
    @remy = FactoryGirl.create(:user)
    @daffodil = FactoryGirl.create(:user)
    @message = Message.new(
      sender_id: @remy.id,
      receiver_id: @daffodil.id,
      content: "hello cutie")
  end
  describe "validations" do
    it { should validate_presence_of(:sender_id) }
    it { should validate_presence_of(:receiver_id) }
    it { should validate_presence_of(:content) }
  end
  describe "#sender" do
    it "finds sender username by id" do
      expect(@message.sender).to eq(@remy.username)
    end
  end
  describe "#receiver" do
    it "finds receiver username by id" do
      expect(@message.receiver).to eq(@daffodil.username)
    end
  end
end
