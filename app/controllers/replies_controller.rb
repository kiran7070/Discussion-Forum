class RepliesController < ApplicationController
  def index
    @comment = Comment.find(params[:comment_id])
    @reply = @comment.replies
  end

  # def edit
  #   @comment = Comment.find(params[:comment_id])
  #   @reply = @comment.replies.find(params[:id])

  # end

  def new
     @comment = Comment.find(params[:comment_id])
    @reply = Reply.new
  end

  def create
    @comment = Comment.find(params[:comment_id])
    @reply = @comment.replies.create(reply_params)
    
    redirect_to  discussion_comments_path

  end

  def show
    @comment = Comment.find(params[:comment_id])
    @reply = Reply.find(params[:id])
  end
  private
  def reply_params
    params.permit(:reply,:username)
  end
end
