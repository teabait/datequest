class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :birthdate, presence: true
  validates :location, presence: true
  has_secure_password

  def ranks
    ["cabin boy", "cook", "captain", "commander", "charizard"]
  end
end
