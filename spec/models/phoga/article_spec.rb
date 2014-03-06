# coding: utf-8
require 'spec_helper'

module Phoga
  describe Article do
    describe 'Validations' do
      let(:article) { FactoryGirl.build(:article) }

      describe 'user_id' do
        it '必ず入力されていること' do
          article.admin_id = nil
          article.valid?
          expect(article.errors.has_key?(:admin_id)).to be
        end
      end
    end

    describe 'after_initialize: set_default_categorization' do
      context 'インスタンス生成後にcategorizationsが空だったら' do
        it 'categorizationsのインスタンスを生成すること' do
          @article = Phoga::Article.new
          expect(@article.categorizations.first).to be_an_instance_of(Phoga::Categorization)
        end
      end

      context 'インスタンス生成後にcategorizationsが空じゃなかったら' do
        it 'categorizationsのインスタンスを生成しないこと' do
          article = FactoryGirl.create(:article)
          result = Phoga::Article.last.categorizations.select{|cat| !cat.persisted? }
          expect(result).to eq([])
        end
      end
    end
  end
end
