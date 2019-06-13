class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      redirect_to @commentable, notice: "コメントを投稿しました。"
    end
  end
  
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to comment.commentable, notice: "コメントを削除しました。"
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
