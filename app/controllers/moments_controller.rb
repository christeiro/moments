class MomentsController < ApplicationController
  before_action :set_params, only: [ :create ]
  before_action :set_moment, only: [ :edit, :show, :update, :destroy ]
  before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :show ]

  def index
    @moments = Moment.all
  end

  def new
    @moment = Moment.new
  end

  def create
    @moment = Moment.new(set_params)
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

  private
  def set_params
    params.require(:moment).permit(:image, :caption)
  end

  def set_moment
    @moment = Moment.find(params[:id])
  end
end
