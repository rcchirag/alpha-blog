class ArticlesController < ApplicationController

  def new
    @articles = Article.new
  end

  def create
      @articles = Article.new(article_params)
     if @articles.save
      redirect_to article_path(@articles)
     else
      render 'new'
     end

  end

  def show
    @articles = Article.find(params[:id])

  end

  def edit
    @article = Article.find(params[:id])

  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end

  end





  private
  def article_params
    params.require(:article).permit(:title, :description)
  end


end
