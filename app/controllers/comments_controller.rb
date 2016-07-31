class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_moment

  def create
    @comment = @moment.comments.build(set_params)
    @comment.user_id = current_user.id
    if @comment.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      flash[:alert] = "Check the comment form, something went horribly wrong!"
      render root_path
    end
  end

  def destroy
    @comment = @moment.comments.find(params[:id])
    if @comment.user.id = current_user.id
      @comment.delete
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  private

  def set_params
    params.require(:comment).permit(:content)
  end

  def set_moment
    @moment = Moment.find(params[:moment_id])
  end
end