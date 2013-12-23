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

  def text_challenges
    user1 = inviter
    user2 = invitee
    user1_number = inviter.phone
    user2 = invitee.phone

    @client ||= Twilio::REST::Client.new Figaro.env.twilio_sid, Figaro.env.twilio_token
    @client.account.sms.messages.create(
      :from => "+1#{Figaro.env.twilio_phone_number}",
      :to => "+1#{user1_number}",
      :body => "#{self.challenges[1].description}"
    )
    @client.account.sms.messages.create(
      :from => "+1#{Figaro.env.twilio_phone_number}",
      :to => "+1#{user1_number}",
      :body => "#{self.challenges[2].description}"
    )
    @client.account.sms.messages.create(
      :from => "+1#{Figaro.env.twilio_phone_number}",
      :to => "+1#{user1_number}",
      :body => "#{self.challenges[0].description}"
    )
  end

  def accept
    self.accepted = true
    self.rejected = false
  end

  def reject
    self.rejected = true
    self.accepted = false
  end
end
