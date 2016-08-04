class AddendumsController < ApplicationController
  before_action :require_user, only: [:create, :destroy]
  before_action :set_object, only: [:create]
  before_action :allowed_to_destroy, only: [:destroy]

  def create
    @addendum = current_user.written_addendums.create!(
      commentable: @object,
      body: params[:addendum][:body]
    )
    respond_to do |format|
      format.json {
        render :show, status: :created, location: [@addendum.commentable, @addendum]
      }
    end
  end

  def destroy
    @addendum.destroy
    flash[:success] = "That addendum has shuffled off this mortal coil"
    redirect_back(fallback_location: root_path)
  end

  private

  def set_object
    if params[:post_id]
      @object = Post.find(params[:post_id])
    elsif params[:user_id]
      @object = User.find(params[:user_id])
    end
  end

  def allowed_to_destroy
    @addendum = Addendum.find(params[:id])
    unless @addendum.allowed_to_destroy?(current_user)
      redirect_back(fallback_location: root_path, flash: {danger: "Hey asshole, that ain't yours"})
    end
  end

end
