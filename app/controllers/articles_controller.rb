class ArticlesController < ApplicationController

  def index
    @articles = Article.where(user_id: current_user.id)
    @skills = Skill.first(8)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to users_path
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content).merge(user_id: current_user.id)
  end
end
