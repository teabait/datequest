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
    current_user.delay(run_at: 45.seconds.from_now).level_up
    # current_user.level_up
    if @quest.save
      redirect_to user_quests_path(current_user.id)
    else
      redirect_to root_path
    end
      # @quest.delay(run_at: @quest.quest_date).text_challenges
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
end
