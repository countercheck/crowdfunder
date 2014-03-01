class SessionsController < ApplicationController

 	def new
  end

  def create
    if @user = login(params[:email], params[:password], params[:remember_me])
      redirect_back_or_to campaigns_path, :notice => 'Logged in!'
    else
      flash.now[:alert] = "Login failed"
      render :new
    end
  end

  def destroy
    logout
    redirect_to campaigns_path, :notice =>'Logged out.'
  end

end