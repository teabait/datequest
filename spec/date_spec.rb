require 'spec_helper'

describe Quest do
  describe "validations" do
    it { should validate_presence_of(:date_time) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:date_creator) }
    it { should validate_presence_of(:date_acceptor) }
  end
end
