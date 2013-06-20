# coding: utf-8
class Phoga::ArticlesController < Phoga::ApplicationController
  # GET /admin/articles
  def index
    @articles = Article.all
  end

  # GET /admin/articles/:id
  def show
    @article = Article.find(params[:id])
  end

  # GET /admin/articles/new
  def new
    @article = Article.new
  end

  # POST /admin/articles
  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to admin_article_path(@article), notice: ''
    else
      flash[:alert] = ''
      render :new
    end
  end

  # GET /admin/article/:id/edit
  def edit
    @article = Article.find(params[:id])
  end

  # PUT /admin/articles/:id
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to admin_article_path(@article), notice: ''
    else
      flash[:alert] = ''
      render :edit
    end
  end

  # DELETE /admin/articles/:id
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to admin_articles_path, notice: ''
  end
end
