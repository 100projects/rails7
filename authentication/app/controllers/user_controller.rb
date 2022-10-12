class UserController < ApplicationController

  before_action :ensure_current_user

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_url
    else
      render :new, status: 422
    end
    
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :terms)
  end

  def not_found
    render "404.html", status: 404
  end

  
end
