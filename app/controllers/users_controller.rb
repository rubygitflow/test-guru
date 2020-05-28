class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

  def new
    @user = User.new
    puts "#{@user.inspect}"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "#{@user.name}, you are registered in the system."
      redirect_to tests_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
