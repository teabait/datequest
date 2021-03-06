class UsersController < ApplicationController

  before_action :authenticated!, :set_user, :authorized!, except: [:new, :create, :show, :index]

  def index
    @users = User.all
    render :index
  end

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    @user.rank = @user.ranks[0]
    if @user.age < 18
      redirect_to new_user_path, notice: "YOU ARE TOO YOUNG"
    elsif @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def edit
    render :edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to new_user_path
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(session[:user_id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :birthdate, :avatar, :phone, :blurb, :location, :password, :password_confirmation)
  end


  def authorized!
    unless @user.id == session[:user_id]
      redirect_to user_path(@user)
    end
  end
end
