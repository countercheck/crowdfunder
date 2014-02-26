class BreakpointsController < ApplicationController

	before_filter :load_campaign

	def create
		@breakpoint = @campaign.breakpoints.new(breakpoint_params)

		if @breakpoint.save
			redirect_to campaign_path(@campaign), notice: 'breakpoint created!'
		else
	    render :show
		end

	end

  private
  def breakpoint_params
  	params.require(:breakpoint).permit(:title, :description, :estimated_delivery, :value_in_cents, :campaign_id, :number_available)
  end

  def load_campaign
  	@campaign = Campaign.find(params[:campaign_id])
  end

end