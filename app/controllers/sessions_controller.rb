class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Wellcome, #{user.name}!"
      redirect_to cookies[:target_url] || root_path
    else
      flash.now[:alert] = 'Verify your Email or Password'
      render :new
    end
  end

  def destroy
    user = User.find_by(id: session[:user_id])
    session[:user_id] = nil
    flash[:notice] = 'See you soon, #{user.name}!'
    redirect_to login_path
  end
end
