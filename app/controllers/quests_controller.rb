
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
    # @quest.delay(run_at: @quest.quest_date).text_challenges
    # current_user.delay(run_at: 45.seconds.from_now).level_up
    if @quest.save
      redirect_to user_quests_path(current_user.id)
    else
      redirect_to root_path
    end
      # @quest.delay(run_at: @quest.quest_date).text_challenges
  end

  def index
    @quests = current_user.new_quests
    @sent_quests = current_user.sent_quests
    @upcoming_quests = current_user.upcoming_quests
    render :index
  end

  def update
    @quest = Quest.find_by(id: params[:id])
    if params[:rejected] == "true"
      flash[:notice] = "You rejected the user"
      @quest.reject
    else
      flash[:notice] = "You are going to go on a date!"
      @quest.accept
      @quest.delay(run_at: @quest.quest_date).text_challenges
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
