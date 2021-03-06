class CampaignsController < ApplicationController

  before_filter :ensure_logged_in, :only => [:edit, :destroy, :new]

  def index

    if params[:tag]
      @campaigns = Campaign.tagged_with(params[:tag]).order("created_at DESC").page
    else
      @campaigns = Campaign.page(params[:page]).order("created_at DESC")
    end

    respond_to do |format|
      format.html #initial load
      format.js #after clicking a page link
    end

  end


  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.user = current_user

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
    @comment = Comment.new( :campaign_id => @campaign.id )
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
    params.require(:campaign).permit(:tag_list, :id, :title, :description, :target_in_cents, :start_date, :end_date)
  end

end
