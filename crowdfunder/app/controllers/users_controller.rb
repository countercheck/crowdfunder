class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def show
    @user = current_user
    @campaigns = @user.breakpoints.map { |b| b.campaign  }
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to campaigns_path
  	else
  		render :new
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
