class Quest < ActiveRecord::Base
  validates :date_time, presence: true
  validates :date_creator, presence: true
  validates :date_acceptor, presence: true
  validates :description, presence: true
end
