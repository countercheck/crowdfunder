class CampaignsController < ApplicationController

  def index
    @campaigns = Campaign.all
  end

  def new
  @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    if @campaign.save
      redirect_to campaign_path(@campaign)
    else
      render :new
    end
  end

  def show
    @campaign = Campaign.find(params[:id])
    @breakpoint = @campaign.breakpoints.new
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update_attributes(campaign_params)
      redirect_to campaign_path(@campaign)
    else
      render :edit
    end
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @product.destroy
    redirect to campaigns_path
  end

  private
  def campaign_params
    params.require(:campaign).permit(:id, :title, :description, :target_in_cents, :start_date, :end_date)
  end

end
