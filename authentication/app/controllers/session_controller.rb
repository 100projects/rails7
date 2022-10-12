class SessionController < ApplicationController

  before_action :ensure_current_user, only: [:new]

  def new
    @user = User.new()
  end

  def create
    @user = User.find_by(email: user_params[:email])

    if @user && @user.is_password?(user_params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash.now[:notice] = "Invalid email or password"
      render :new, status: 404
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
