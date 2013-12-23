class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :birthdate, presence: true
  validates :location, presence: true
  validates :rank, presence: true
  has_secure_password

  def rank_name
    self.ranks[self.rank]
  end

  def ranks
    ["cabin boy", "cook", "captain", "commander", "charizard"]
  end

  def age
    now = Time.now.utc.to_date
    now.year - birthdate.year - ((now.month > birthdate.month || (now.month == birthdate.month && now.day >= birthdate.day)) ? 0 : 1)
  end

  def level_up
    self.rank += 1
    self.save
  end

  def new_quests
    Quest.where(
      acceptor: self.id,
      accepted: false,
      rejected: false
    )
  end

  def sent_quests
    Quest.where(creator: self.id)
  end

  def upcoming_quests
    Quest.where(
      acceptor: self.id,
      accepted: true
    )
  end
end
