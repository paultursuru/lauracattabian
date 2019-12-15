class ArticlesController < ApplicationController
  before_action :set_article, only: %I[show, edit, update, destroy]
  def index
    @articles = Article.all
  end

  def applications
    @articles = Article.where(category: 'Application')
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
  end

  def edit
  end

  def update
    @article.save
  end

  def destroy
    @article.destroy
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :subtitle, :content, :category)
  end
end
