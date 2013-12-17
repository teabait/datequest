class AppController < ApplicationController
  def index
    if logged_in?
      redirect_to users_path
    else
      redirect_to welcome_path
    end
  end
end
