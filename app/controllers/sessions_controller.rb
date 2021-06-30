# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    redirect_to root_path if current_user
  end

  def create
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:login_permitted_path] || root_path
      session.delete(:login_permitted_path)
    else
      flash.now[:alert] = 'Login or password are incorrect'
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end
