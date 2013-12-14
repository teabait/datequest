require 'spec_helper'

describe Message do
  describe "validations" do
    it { should validate_presence_of(:sender_id) }
    it { should validate_presence_of(:receiver_id) }
    it { should validate_presence_of(:content) }
  end
end
