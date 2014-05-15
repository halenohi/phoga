class Phoga::TagsController < Phoga::ApplicationController
  # GET /admin/tags
  def index
    @tags = Phoga::Tag.page(params[:page]).per(30)
  end

  # GET /admin/tags/new
  def new
    @tag = Phoga::Tag.new
  end

  # POST /admin/tags
  def create
    @tag = Phoga::Tag.new(tag_params)
    if @tag.save
      redirect_to edit_tag_path(@tag), notice: 'タグを登録しました'
    else
      flash.now[:alert] = 'タグを登録できませんでした'
      render :new
    end
  end

  # GET /admin/tags/:id/edit
  def edit
    @tag = Phoga::Tag.find(params[:id])
  end

  # PUT /admin/tags/:id
  def update
    @tag = Phoga::Tag.find(params[:id])
    if @tag.update_attributes(tag_params)
      redirect_to edit_tag_path(@tag), notice: 'タグを更新しました'
    else
      flash.now[:alert] = 'タグを更新できませんでした'
      render :edit
    end
  end

  # DELETE /admin/tags/:id
  def destroy
    @tag = Phoga::Tag.find(params[:id])
    @tag.destroy
    redirect_to tags_path, notice: 'タグを削除しました'
  end

  private
    def tag_params
      params.require(:tag)
        .permit(:name, :slug)
    end
end
