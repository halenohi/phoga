class Phoga::ArticlesController < Phoga::ApplicationController
  include Phoga::ArticleFormHelper

  # GET /admin/articles
  def index
    @articles = Phoga::Article.page(params[:page]).per(30)
  end

  # GET /admin/articles/new
  def new
    @article = Phoga::Article.new
    @categories = Phoga::Category.all
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
    @categories = Phoga::Category.all
  end

  # PUT /admin/articles/:id
  def update
    @article = Phoga::Article.find(params[:id])
    if @article.update_attributes(setup_tags_and_taggings_attributes(article_params, @article))
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
      @article_params ||= setup_categorizations_attributes(
        params.require(:article)
          .permit(:title, :content, :admin_id, :tag_names,
                  categorizations_attributes: [:id, :category_id, :apply],
                  custom_fields_attributes: [:name, :content, :image],
                  taggings_attributes: [:id, :_destroy],
                  tags_attributes: [:name])
          .merge({ admin_id: current_admin.id })
      )
    end
end
