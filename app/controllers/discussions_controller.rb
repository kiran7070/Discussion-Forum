class DiscussionsController < ApplicationController
  def index
   # @article = Discussion.where(pinned: true) + Discussion.where(pinned: false)
    @article = Discussion.order("pinned DESC")
  end

  def new
    @article = Discussion.new
  end

  def create
    @article = Discussion.new(article_params)
    if @article.save
      redirect_to  discussions_path
      flash[:notice] = "Successfully Created Article"
    else
      render :new, status: :unprocessable_entity
      flash[:notice] = "Create New Article"
    end

  end

  def edit
    @article = Discussion.find(params[:id])
  end

  def pin 
    @article = Discussion.find(params[:id].to_i)
    @article.pinned = true
    if @article.save
      redirect_to  discussions_path
    end
  end

  def unpin 
    @article = Discussion.find(params[:id].to_i)
    @article.pinned = false
    if @article.save
      redirect_to  discussions_path
    end
  end

  def update
    
    @article = Discussion.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def like 
    
    @article = Discussion.find(params[:id])
    #binding.pry
    @article.likes+=1
    @article.save
    redirect_to discussions_path
  end

  def show
    @article = Discussion.find(params[:id])
  end
  private
  def article_params
    params.require(:discussion).permit(:title,:content,:likes,:name,:image)
  end
end
