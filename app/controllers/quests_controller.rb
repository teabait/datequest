class QuestsController < ApplicationController
  def new
    @quest = Quest.new
    render :new
  end

  def create
    quest_params = get_params
    quest_params[:creator] = current_user.id
    quest_params[:acceptor] = params[:user_id]
    binding.pry
    @quest = Quest.new(quest_params)
    binding.pry
    if @quest.save
      redirect_to user_path(params[:user_id])
    else
      redirect_to root_path
    end
  end

  private

  def get_params
    params.require(:quest).permit(:location, :description, :date_time)
  end
end