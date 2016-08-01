class MomentsController < ApplicationController
  before_action :set_params, only: [ :create ]
  before_action :set_moment, only: [ :edit, :show, :update, :destroy, :like ]
  before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :like ]
  before_action :owned_moment, only: [ :edit, :update, :destroy]

  def index
    @moments = Moment.all.order('created_at DESC').page params[:page]
  end

  def new
    @moment = current_user.moments.build
  end

  def create
    @moment = current_user.moments.build(set_params)
    if @moment.save
      flash[:success] = "Your moment was created!"
      redirect_to @moment
    else
      flash[:error] = "Error! You need an image for creating a moment"
      render :new
    end
  end

  def edit
    @moment = Moment.find(params[:id])
  end

  def show
  end

  def update
    if @moment.update(set_params)
      flash[:success] = "Moment updated!"
      redirect_to moment_path(@moment)
    else
      flash[:alert] = "Update failed. Please check the form!"
      render :edit
    end
  end

  def destroy
    @moment.destroy
    flash[:success] = "Moment successfully deleted!"
    redirect_to moments_path
  end

  def like
    if @moment.liked_by current_user
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
  end

  private
  def set_params
    params.require(:moment).permit(:image, :caption)
  end

  def set_moment
    @moment = Moment.find(params[:id])
  end

  def owned_moment
    unless current_user == @moment.user
      flash[:alert] = "That post doesn't belong to you!"
      redirect_to root_path
    end
  end
end
