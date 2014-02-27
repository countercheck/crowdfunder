class CampaignsController < ApplicationController

  def index
    @campaigns = Campaign.all
  end

  def new
    @campaign = Campaign.new

  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.owner_id = current_user.id

    if @campaign.save
      redirect_to campaign_path(@campaign)
    else
      render :new
    end
  end

  def show
    @campaign = Campaign.find(params[:id])
    @breakpoints = @campaign.breakpoints.all
    # this will add an empty element to the end of this array
    # @breakpoint = @campaign.breakpoints.new  # this should be build or create
    #so instead we use
    @breakpoint = Breakpoint.new( :campaign_id => @campaign.id )
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
