class Phoga::CategoriesController < Phoga::ApplicationController
  # GET /admin/categories
  def index
    @categories = Phoga::Category.page(params[:page]).per(30)
  end

  # GET /admin/categories/new
  def new
    @category = Phoga::Category.new
  end

  # POST /admin/categories
  def create
    @category = Phoga::Category.new(category_params)
    if @category.save
      redirect_to edit_category_path(@category), notice: 'カテゴリーを登録しました'
    else
      render :new
    end
  end

  # GET /admin/categories/:id/edit
  def edit
    @category = Phoga::Category.find(params[:id])
  end

  # PUT /admin/categories/:id
  def update
    @category = Phoga::Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to edit_category_path(@category), notice: 'カテゴリーを更新しました'
    else
      render :edit
    end
  end

  # DELETE /admin/categories/:id
  def destroy
    @category = Phoga::Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, notice: 'カテゴリーを削除しました'
  end

  private
    def category_params
      params.require(:category)
        .permit(:name, :slug, :parent_id, :position)
    end
end
