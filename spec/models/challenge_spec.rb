require 'spec_helper'

describe Challenge do
  describe "validations" do
    it { should validate_presence_of(:description) }
  end
end
