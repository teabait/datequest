require 'spec_helper'

describe Date do
  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:birthdate) }
    it { should have_secure_password }
    it { should validate_presence_of(:location) }
  end
end
