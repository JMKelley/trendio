class BucketsController < ApplicationController

  # CanCan auth here!

  def create
    widget_id = params[:widget_id]
    bucket = Bucket.new(widget_id: widget_id, user_id: current_user.id)
    bucket.save
    render :json, bucket
  end

  def destroy
    current_user.buckets.where(widget_id: params[:widget_id]).destroy!
    render :json, current_user
  end

end
