class QuestsController < ApplicationController
  def new
    @quest = Quest.new
    render :new
  end

  def create
    quest_win = quest_params
    quest_win[:creator] = current_user.id
    quest_win[:acceptor] = params[:user_id]
    quest_win[:date_time] = '2004-10-19 10:23:54'
    binding.pry
    @quest = Quest.new(quest_win)
    binding.pry
    if @quest.save
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  private

  def quest_params
    params.require(:quest).permit(:location, :description)
  end
end
