class Challenge < ActiveRecord::Base
  validates :description, presence: true
  validates :rank, presence: true

  def get_challenge(rank)
    Challenge.where(rank: rank)
  end
end
