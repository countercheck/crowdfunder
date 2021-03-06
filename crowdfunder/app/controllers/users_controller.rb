class UsersController < ApplicationController

   before_filter :ensure_logged_in, :only => [:edit, :show]

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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
