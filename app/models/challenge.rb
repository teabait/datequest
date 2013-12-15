class Challenge < ActiveRecord::Base
  validates :description, presence: true
  validates :rank, presence: true
end
