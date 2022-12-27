class CommentsController < ApplicationController
  def index
   # binding.pry
    @discussion = Discussion.find(params[:discussion_id])
    @comments = @discussion.comments
  end

  def new
    @discussion = Discussion.find(params[:discussion_id])
    @comment = Comment.new
  end

  def edit
    @discussion = Discussion.find(params[:discussion_id])
    @comment = @discussion.comments.find(params[:id])
    
  end

  def update
    
    @discussion = Discussion.find(params[:discussion_id])
    @comment = Comment.find(params[:id])
    #binding.pry
    if @comment.update(comment_params)
      redirect_to discussion_comments_path(@discussion)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Discussion.find(params[:discussion_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to discussion_comments_path(@discussion), status: 303
  end
  
  def create
    @discussion = Discussion.find(params[:discussion_id])
    @comment = @discussion.comments.create(comment_params)
    
    
       redirect_to  discussion_comments_path(id: @discussion.id)

  end

  def show
    @discussion = Discussion.find(params[:discussion_id])
    @comments = @discussion.comments
    # @comment = Comment.find(params[:id])
  end
  private
  def comment_params
    params.require(:comment).permit(:comment,:username)
  end
end
