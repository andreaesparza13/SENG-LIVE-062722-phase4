class SessionsController < ApplicationController
  # Anything dealing with creating and destroying sessions belongs here
    # This is for login/logout, NOT for creating users

  # login
  def create
    user = User.find_by_(name: params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: user, status: :ok
    else
      render json: { error: "Invalid username or password" }, status: :unauthorized
    end
  end

  # logout
  def destroy
    session.delete :user_id
    head :no_content # not really necessary
  end
end
