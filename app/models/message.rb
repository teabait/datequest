class Message  < ActiveRecord::Base
  validates :sender_id, presence: true
  validates :receiver_id, presence: true
  validates :content, presence: true

  def sender
    sender = User.find_by(id: self.sender_id)
    sender.username
  end
end
