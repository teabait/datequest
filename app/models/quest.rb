class Quest < ActiveRecord::Base
  validates :quest_date, presence: true
  validates :creator, presence: true
  validates :acceptor, presence: true
  validates :description, presence: true

  has_and_belongs_to_many :challenges

  def inviter
    inviter = User.find_by(id: self.creator)
  end

  def invitee
    invitee = User.find_by(id: self.acceptor)
  end

  def assign_challenges(user)
    @challenges = Challenge.where(rank: user.rank).limit(3).order("RANDOM()")
    @challenges.each do |challenge|
      self.challenges << challenge
    end
  end

  def end_challenge_window
    self.quest_date. + 5.hours
  end
end
