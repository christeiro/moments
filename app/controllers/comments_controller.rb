class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_moment

  def create
    @comment = @moment.comments.build(set_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Your comment was added to the moment"
      redirect_to :back
    else
      flash[:alert] = "Check the comment form, something went horribly wrong!"
      render root_path
    end
  end

  def destroy
    @comment = @moment.comments.find(params[:id])
    if @comment.user.id = current_user.id
      if @comment.destroy
        flash[:success] = 'Your comment was deleted!'
      end
    else
      flash[:alert] = 'Unable to delete a comment'
    end
    redirect_to root_path
  end

  private

  def set_params
    params.require(:comment).permit(:content)
  end

  def set_moment
    @moment = Moment.find(params[:moment_id])
  end
end