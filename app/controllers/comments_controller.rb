class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.commentable = commentable
    if comment.save
      redirect_to comment.commentable, notice: "コメントを投稿しました。"
    end
  end
  
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to comment.commentable, notice: "コメントを削除しました。"
  end

  private

  def comment_params
    params.require(:comment).permit(
      :body,
      :commentable_id,
      :commentable_type
    )
  end

  def commentable
    klass = params[:comment][:commentable_type].constantize
    klass.find(params[:comment][:commentable_id])
  end
end
