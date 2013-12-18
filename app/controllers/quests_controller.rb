class QuestsController < ApplicationController
  def new
    @quest = Quest.new
    render :new
  end

  def create
    quest_params = get_params
    quest_params[:creator] = current_user.id
    quest_params[:acceptor] = params[:user_id]
    @quest = Quest.new(quest_params)
    @quest.assign_challenges(current_user)
          text_challenges
    if @quest.save
      redirect_to user_quests_path(current_user.id)
    else
      redirect_to root_path
    end
  end

  def index
    @quests = Quest.where(
      acceptor: current_user.id,
      accepted: false,
      rejected: false
    )
    @sent_quests = Quest.where(creator: current_user.id)
    @upcoming_quests = Quest.where(
      acceptor: current_user.id,
      accepted: true
    )
    render :index
  end

  def update
    @quest = Quest.find_by(id: params[:id])
    if params[:rejected] == "true"
      flash[:notice] = "You rejected the user"
      @quest.rejected = true
      @quest.accepted = false
    else
      flash[:notice] = "You are going to go on a date!"
      @quest.accepted = true
      @quest.rejected = false
    end
    @quest.save
    redirect_to user_quests_path
  end

  def show
    @quest = Quest.find_by(id: params[:id])
    @challenges = @quest.challenges
    render :show
  end

  private

  def get_params
    params.require(:quest).permit(:location, :description, :quest_date)
  end

  def text_challenges
    require 'twilio-ruby'
    user1 = User.find_by(id: @quest.creator)
    # user2 = User.find_by(id: self.acceptor)
    user1_number = user1.phone
    # user2_number = user2.phone
    twilio_sid = "AC5b47aab6279975c232f1489625f36b43"
    twilio_token = "8af3210fdedeec8ed0a4d6857953f25b"
    twilio_phone_number = "4087067936"
    @client ||= Twilio::REST::Client.new twilio_sid, twilio_token
    @client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => "+1#{user1_number}",
      :body => "#{@quest.challenges[1].description}"
    )
    @client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => "+1#{user1_number}",
      :body => "#{@quest.challenges[2].description}"
    )
    @client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => "+1#{user1_number}",
      :body => "#{@quest.challenges[2].description}"
    )
  end
end
