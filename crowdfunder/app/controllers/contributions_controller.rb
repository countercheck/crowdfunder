class ContributionsController < ApplicationController
  before_filter :load_breakpoint

  def create
    @contribution = @breakpoint.contributions.new(contribution_params)
    if @contribution.save
      redirect_to campaign_path(@campaign)
    end
  end

  def destroy
  end

  private
  def contribution_params
    params.require(:contribution).permit(:breakpoint_id)
  end

  def load_breakpoint
    @breakpoint = Breakpoint.find(params[:contribution][:breakpoint_id])
    @campaign = Campaign.find(params[:campaign_id])
  end
end
