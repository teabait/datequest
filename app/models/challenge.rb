class Challenge < ActiveRecord::Base
  validates :description, presence: true
end
