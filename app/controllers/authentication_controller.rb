class AuthenticationController < ApplicationController

  def new
  end

  def create
    if @user = User.find_by(username: params[:user][:username]).try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id
      Rails.logger.info @user.inspect
      flash[:success] = "Welcome back!"
      redirect_to :root
    else
      flash[:warning] = "Those credentials were not found"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out"
    redirect_back(fallback_location: root_path)
  end

end
