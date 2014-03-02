class CommentsController < ApplicationController

  before_filter :load_campaign
  #so that there's always a product loaded
  before_filter :ensure_logged_in, :only => [:show, :create, :show, :update, :destroy]
  #only ensure logged in for the methods in the hash.

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = @campaign.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to campaign_path(@campaign), notice: 'Comment created!'
    else
      render :show
    end

  end

  def destroy
    @comment = @campaign.comments.find(params[:id])
    @comment.destroy
    redirect_to campaign_path(@campaign)
  end

  def edit
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :campaign_id, :comment_id)
  end

  def load_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end


end
