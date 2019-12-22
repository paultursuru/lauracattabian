class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:partenaires, :applications, :actualites, :ateliers, :formations, :livres, :musiques, :show]
  before_action :set_article, only: %I[show, edit, update, destroy]

  # actions for categories
  def partenaires
    @articles = Article.where(category: 'Partenaire')
  end

  def applications
    @articles = Article.where(category: 'Application')
  end

  def actualites
    @articles = Article.where(category: 'Actualité')
  end

  def ateliers
    @articles = Article.where(category: 'Atelier')
  end

  def formations
    @articles = Article.where(category: 'Formation')
  end

  def livres
    @articles = Article.where(category: 'Livre')
  end

  def musiques
    @articles = Article.where(category: 'Musique')
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

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :subtitle, :content, :category, :photo)
  end
end
