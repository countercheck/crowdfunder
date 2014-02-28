class ContributionsController < ApplicationController
  before_filter :load_breakpoint
    before_filter :ensure_logged_in

  def create
    #@contribution = @breakpoint.contributions.new(:breakpoint_id => params[:breakpoint_id])
    @contribution = @breakpoint.contributions.new(contribution_params)
    @contribution.user = current_user
    @contribution.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
  end

  private
  def contribution_params
    params.permit(:breakpoint_id)
  end

  def load_breakpoint
    @breakpoint = Breakpoint.find(params[:breakpoint_id])
    @campaign = Campaign.find(params[:campaign_id])
  end
end
