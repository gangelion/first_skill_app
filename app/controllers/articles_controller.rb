class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    if @article.save(article_params)
      redirect_to users_path
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
