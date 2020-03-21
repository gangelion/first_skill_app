class ArticlesController < ApplicationController
  before_action :set_article_params, only: %i[show edit update destroy]

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
      redirect_to users_path, notice: "記事が投稿されました"
    else
      flash.now[:alert] = "記事の投稿に失敗しました"
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to users_path, notice: "記事が更新されました"
    else
      flash.now[:alert] = "記事の更新に失敗しました"
      render :edit
    end
  end

  def destroy
    if @article.destroy
      redirect_to users_path, notice: "記事が削除されました"
    else
      flash.now[:alert] = "記事の削除に失敗しました"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content).merge(user_id: current_user.id)
  end

  def set_article_params
    @article = Article.find(params[:id])
  end
end
