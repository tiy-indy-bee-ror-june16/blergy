class ThumbsController < ApplicationController
  before_action :require_user

  def create
    @thumb = current_user.thumbs.create!(
      value: params[:value] || 1,
      post_id: params[:post_id]
    )
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

end
