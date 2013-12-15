require 'spec_helper'

describe User do
  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:birthdate) }
    it { should have_secure_password }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:rank) }
  end
  let(:remy) { FactoryGirl.create(:user, username: "remy") }
  let(:daffodil) { FactoryGirl.create(:user, username: "daffodil") }
end
