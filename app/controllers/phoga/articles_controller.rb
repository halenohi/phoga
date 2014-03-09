class Phoga::ArticlesController < Phoga::ApplicationController
  # GET /admin/articles
  def index
    @articles = Phoga::Article.page(params[:page]).per(30)
  end

  # GET /admin/articles/new
  def new
    @article = Phoga::Article.new
  end

  # POST /admin/articles
  def create
    @article = Phoga::Article.new(article_params)
    if @article.save
      redirect_to edit_article_path(@article), notice: '記事を作成しました'
    else
      flash.now[:alert] = '記事を作成出来ませんでした'
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
    set_destroy_param_to_categorizations
    if @article.update_attributes(article_params)
      redirect_to edit_article_path(@article), notice: '記事を更新しました'
    else
      flash.now[:alert] = '記事を更新出来ませんでした'
      render :edit
    end
  end

  # DELETE /admin/articles/:id
  def destroy
    @article = Phoga::Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, notice: '記事を削除しました'
  end

  private
    def article_params
      @article_params ||= params.require(:article)
        .permit(:title, :content, :admin_id,
                categorizations_attributes: [:category_id],
                custom_fields_attributes: [:name, :content, :image],
                taggings_attributes: [:tag_id])
        .merge({ admin_id: current_admin.id })
    end

    def set_destroy_param_to_categorizations
      article_params[:categorizations_attributes] ||= []
      category_ids_param = article_params[:categorizations_attributes].map{|c| c[:category_id] }
      discarded_category_ids = @article.category_ids - category_ids_param
      article_params[:categorizations_attributes].concat discarded_category_ids.map{ |cat_id|
        id = @article.categorizations.select{|c| c.category_id == cat_id }.first.id
        { id: id, category_id: cat_id, _destroy: true }
      }
    end
end
