require 'spec_helper'

describe Quest do
  describe "validations" do
    it { should validate_presence_of(:quest_date) }
    it { should validate_presence_of(:quest_time) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:creator) }
    it { should validate_presence_of(:acceptor) }
  end
end
