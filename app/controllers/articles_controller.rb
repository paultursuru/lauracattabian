class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:by_category, :show]
  before_action :user_admin?, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_article, only: %I[show, edit, update, destroy]


  def by_category
    @category = params[:category]
    user_admin? if @category == "archive"

    @articles = Article.where(category: @category)
    @articles.order(title: :asc) if @category == "partenaire"

    redirect_to home_path if @articles.empty?
  end
  # CRUD for admin

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    user_admin? if @article.category == "archive"
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def user_admin?
    if user_signed_in?
      redirect_to root_path unless current_user.admin
    else
      redirect_to root_path
    end
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :subtitle, :content, :category, :photo, :legend)
  end
end
