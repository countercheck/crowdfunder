class CampaignsController < ApplicationController

  def index
    @campaigns = Campaign.all
  end

  def new
    
  end

  def create
    
  end

  def show
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private
  def campaign_params
    params.require(:campaign).permit(:title, :description, :target_in_cents, :start_date, :end_date)
  end

end
