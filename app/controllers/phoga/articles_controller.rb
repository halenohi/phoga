class Phoga::ArticlesController < Phoga::ApplicationController
  # GET /admin/articles
  def index
    @articles = Phoga::Article.scoped.page(params[:page]).per(30)
  end

  # GET /admin/articles/:id
  def show
    @article = Phoga::Article.find(params[:id])
  end

  # GET /admin/articles/new
  def new
    @article = Phoga::Article.new
  end

  # POST /admin/articles
  def create
    @article = Phoga::Article.new(params[:article])
    if @article.save
      redirect_to @article, notice: ''
    else
      flash[:alert] = ''
      render :new
    end
  end

  # GET /admin/article/:id/edit
  def edit
    @article = Phoga::Article.find(params[:id])
  end

  # PUT /admin/articles/:id
  def update
    @article = Phoga::Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to @article, notice: ''
    else
      flash[:alert] = ''
      render :edit
    end
  end

  # DELETE /admin/articles/:id
  def destroy
    @article = Phoga::Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, notice: ''
  end
end
