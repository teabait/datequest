class Quest < ActiveRecord::Base
  validates :date_time, presence: true
  validates :creator, presence: true
  validates :acceptor, presence: true
  validates :description, presence: true

  def inviter
    inviter = User.find_by(id: self.creator)
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
    self.date_time.hour
  end
end
