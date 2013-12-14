class Quest < ActiveRecord::Base
  validates :date_time, presence: true
  validates :creator, presence: true
  validates :acceptor, presence: true
  validates :description, presence: true
end
