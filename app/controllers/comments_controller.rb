class CommentsController < ApplicationController
  def create
    if params[:book_id]
      create_book_comment
    elsif params[:report_id]
      create_report_comment
    end
  end
  
  def destroy
    if params[:book_id]
      destroy_book_comment
    elsif params[:report_id]
      destroy_report_comment
    end
  end

  private

  def create_book_comment
    @book = Book.find(params[:book_id])
    @book.comments.create(comment_params)
    redirect_to book_path(@book)
  end

  def create_report_comment
    @report = Book.find(params[:report_id])
    @report.comments.create(comment_params)
    redirect_to report_path(@report)
  end

  def destroy_book_comment
    @book = Book.find(params[:book_id])
    @comment = @book.comments.find(params[:id])
    @comment.destroy
    redirect_to book_path(@book)
  end

  def destroy_report_comment
    @report = Report.find(params[:report_id])
    @comment = @report.comments.find(params[:id])
    @comment.destroy
    redirect_to report_path(@report)
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
