require 'spec_helper'

describe Phoga::ArticleFormHelper do
  describe '#setup_categorizations' do
    context 'Phoga::Articleのインスタンスにcategorizationsが1つもセットされていない場合' do
      it '全Phoga::Categoryのcategorizationsがセットされること' do
        FactoryGirl.create(:category)
        FactoryGirl.create(:category)
        article = Phoga::Article.new
        article = helper.setup_categorizations(article)
        expect(article.categorizations.length).to eq(2)
        expect(article.categorizations.map(&:category_id)).to eq(Phoga::Category.pluck(:id))
      end
    end

    context 'Phoga::Articleのインスタンスにcategorizationsが1つセットされている場合' do
      it '重複してcategorizationsがセットされないこと' do
        article = FactoryGirl.create(:article, { admin_id: 1 })
        category = FactoryGirl.create(:category)
        cat_ids = article.categorizations.map(&:category_id).push category.id
        article = helper.setup_categorizations(article)
        expect(article.categorizations.map(&:category_id)).to eq(cat_ids)
      end
    end
  end

  describe '#setup_categorizations_attributes' do
    context 'categorizations_attributesが空の場合' do
      it 'category_idが1のデータがセットされること' do
        params = { categorizations_attributes: [] }
        params = helper.setup_categorizations_attributes(params)
        expect(params[:categorizations_attributes].length).to eq(1)
      end
    end

    context 'categorizations_attributesにapplyが1のデータが含まれている場合' do
      it '指定のcategory_idを含んだデータがセットされること' do
        category = FactoryGirl.create(:category)
        params = { categorizations_attributes: { '0' => { category_id: category.id, apply: 1 } } }
        params = helper.setup_categorizations_attributes(params)
        expect(params[:categorizations_attributes].first[:category_id]).to eq(category.id)
      end
    end

    context 'categorizations_attributesにapplyが0のデータが含まれている場合' do
      it '指定のidと_destroyを含んだデータがセットされること' do
        category = FactoryGirl.create(:category)
        params = { categorizations_attributes: { '0' => { id: 1, category_id: category.id, apply: 0 } } }
        params = helper.setup_categorizations_attributes(params)
        expect(params[:categorizations_attributes].first[:_destroy]).to be
      end
    end
  end

  describe '#setup_tags_and_taggings_attributes' do
    context 'tag_namesに追加されたtag名がセットされている場合' do
      it 'tags_attributesにnameをセットしたhashが追加されること' do
        article = FactoryGirl.create(:article, { admin_id: 1 })
        params = { tag_names: 'hoge,fuga' }
        params = helper.setup_tags_and_taggings_attributes(params, article)
        expect(params[:tags_attributes]).to eq([{ name: 'hoge' }, { name: 'fuga' }])
      end
    end

    context '外されたtag名がある場合' do
      it 'taggings_attributesに_destroyフラグを建てたhashが追加されること' do
        article = FactoryGirl.create(:article, { admin_id: 1 })
        article.tags.create({ name: 'hoge' })
        params = { tag_names: '' }
        params = helper.setup_tags_and_taggings_attributes(params, article)
        expect(params[:taggings_attributes].first[:_destroy]).to be
      end
    end

    context 'tag_namesにTagとして保存されているtag名がセットされている場合' do
      it 'taggings_attributesにtag_idセットしたhashが追加されること' do
        article = FactoryGirl.create(:article, { admin_id: 1 })
        tag = FactoryGirl.create(:tag)
        params = { tag_names: tag.name }
        params = helper.setup_tags_and_taggings_attributes(params, article)
        expect(params[:taggings_attributes].first[:tag_id]).to eq(tag.id)
      end
    end
  end
end
