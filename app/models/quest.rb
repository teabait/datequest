class Quest < ActiveRecord::Base
  validates :quest_time, presence: true
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

  def get_year
    self.date_time.year
  end

  def get_month
    self.date_time.month
  end

  def get_day
    self.date_time.day
  end

  def get_hour
    self.quest_time.hour
  end

  def assign_challenges(user)
    @challenges = Challenge.where(rank: user.rank).limit(3).order("RANDOM()")
    @challenges.each do |challenge|
      self.challenges << challenge
    end
  end
end
