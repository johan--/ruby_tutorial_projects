class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        flash[:notice] = 'Comment was successfully created.'
        format.html { redirect_to root_url }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user, :body)
  end
end
