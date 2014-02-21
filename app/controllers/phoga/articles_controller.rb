class Phoga::ArticlesController < Phoga::ApplicationController
  # GET /admin/articles
  def index
    @articles = Phoga::Article.page(params[:page]).per(30)
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
    @article = Phoga::Article.new(article_params)
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
    if @article.update_attributes(article_params)
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

  private
    def article_params
      params.require(:article)
        .permit(:title, :body, :admin_id,
                categorizations_attributes: [ :category_id ])
        .merge({ admin_id: current_admin.id })
    end
end
