class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:by_category, :partenaires, :applications, :actualites, :ateliers, :formations, :livres, :musiques, :show]
  before_action :set_article, only: %I[show, edit, update, destroy]

  # actions for categories
  # def partenaires
  #   @articles = Article.where(category: 'partenaire').order(title: :asc)
  # end

  # def applications
  #   @articles = Article.where(category: 'apps')
  # end

  # def actualites
  #   @articles = Article.where(category: 'actu')
  # end

  # def ateliers
  #   @articles = Article.where(category: 'atelier')
  # end

  # def formations
  #   @articles = Article.where(category: 'formation')
  # end

  # def livres
  #   @articles = Article.where(category: 'Livre')
  # end

  # def musiques
  #   @articles = Article.where(category: 'Musique')
  # end

  def by_category
    user_admin? if params[:category] == "archive"

    @articles = Article.where(category: params[:category])
    @articles.order(title: :asc) if params[:category] == "partenaire"

    redirect_to home_path if @articles.empty?
  end
  # CRUD for admin

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
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
      redirect_to root_path unless current_user.role == "admin"
    end
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :subtitle, :content, :category, :photo, :legend)
  end
end
