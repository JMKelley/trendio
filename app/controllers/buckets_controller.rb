class BucketsController < ApplicationController

  # CanCan auth here!

  def create
    widget_id = params[:widget_id]
    bucket = Bucket.new(widget_id: widget_id, user_id: current_user.id)
    bucket.save
    respond_to do |format|
      format.json { 
        render json: bucket
      }
    end
  end

  def destroy
    current_user.buckets.where(widget_id: params[:widget_id]).destroy!
    render :json, current_user
  end

end
