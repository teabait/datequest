class Message  < ActiveRecord::Base
  has_one :sender, :class => 'User'
  has_one :recipient, :class => 'User'
end
