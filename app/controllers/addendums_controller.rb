class AddendumsController < ApplicationController
  before_action :require_user, only: [:create]

  def create
    @addendum = current_user.addendums.create!(
      post_id: params[:post_id],
      body: params[:addendum][:body]
    )
    respond_to do |format|
      format.json {
        render :show, status: :created, location: [@addendum.post, @addendum]
      }
    end
  end
end
