class MomentsController < ApplicationController
  before_action :set_params, only: [:create]
  def index
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
      render 'new'
    end
  end

  def show
    # binding.pry
    @moment = Moment.find(params[:id])
  end

  private
  def set_params
    params.require(:moment).permit(:image, :caption)
  end
end
