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
        
      end
    end

    context 'categorizations_attributesにapplyが1のデータが含まれている場合' do
      it '指定のcategory_idを含んだデータがセットされること' do
        
      end
    end

    context 'categorizations_attributesにapplyが0のデータが含まれている場合' do
      it '指定のidと_destroyを含んだデータがセットされること' do
        
      end
    end
  end
end
