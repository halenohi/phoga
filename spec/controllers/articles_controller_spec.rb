# coding: utf-8
require 'spec_helper'

describe Phoga::ArticlesController do
  prepare_admin

  let!(:article) { FactoryGirl.create(:article, { admin_id: admin.id }) }
  let(:article_attr) {
    categorizations_attr = {
      categorizations_attributes: [
        FactoryGirl.build(:categorization_for_attr).attributes,
        FactoryGirl.build(:categorization_for_attr).attributes
      ],
      custom_fields_attributes: [
        FactoryGirl.attributes_for(:custom_field),
        FactoryGirl.attributes_for(:custom_field)
      ],
      taggings_attributes: [
        FactoryGirl.build(:tagging_for_attr).attributes,
        FactoryGirl.build(:tagging_for_attr).attributes
      ]
    }
    FactoryGirl.attributes_for(:article).merge(categorizations_attr)
  }

  describe 'GET #index' do
    context 'ログイン管理者の場合' do
      before { sign_in admin }

      it '一覧ページが表示されること' do
        get :index
        expect(assigns[:articles]).to eq([article])
        expect(response).to be_success
      end
    end

    context '非ログイン管理者の場合' do
      it 'ログインページにリダイレクトされること' do
        get :index
        expect(response).to redirect_to(new_admin_session_path)
      end
    end
  end

  describe 'GET #new' do
    context 'ログイン管理者の場合' do
      before { sign_in admin }

      it '新規作成ページが表示されること' do
        get :new
        expect(assigns[:article]).to be_an_instance_of(Phoga::Article)
        expect(response).to be_success
      end
    end

    context '非ログイン管理者の場合' do
      it 'ログインページにリダイレクトされること' do
        get :new
        expect(response).to redirect_to(new_admin_session_path)
      end
    end
  end

  describe 'POST #create' do
    context 'ログイン管理者の場合' do
      before do
        sign_in admin
        article_attr.merge!({ admin_id: admin.id })
      end

      it 'Phoga::Articleの件数が1つ増えること' do
        expect{ post :create, article: article_attr }.
          to change(Phoga::Article, :count).by(1)
      end

      it 'Phoga::Categorizationも同時に保存されること' do
        expect{ post :create, article: article_attr }.
          to change(Phoga::Categorization, :count).by(2)
      end

      it 'Phoga::CustomFieldも同時に保存されること' do
        expect{ post :create, article: article_attr }.
          to change(Phoga::CustomField, :count).by(2)
      end

      it 'Phoga::Taggingも同時に保存されること' do
        expect{ post :create, article: article_attr }.
          to change(Phoga::Tagging, :count).by(2)
      end

      it 'Article作成後に個別ページにリダイレクトされること' do
        post :create, article: article_attr
        expect(assigns[:article]).to be_an_instance_of(Phoga::Article)
        expect(flash.now[:notice]).to_not be_nil
        expect(response).to redirect_to(edit_article_path(assigns[:article]))
      end
    end

    context '非ログイン管理者の場合' do
      it 'ログインページにリダイレクトされること' do
        get :create
        expect(response).to redirect_to(new_admin_session_path)
      end
    end
  end

  describe 'GET #edit' do
    context 'ログイン管理者の場合' do
      before { sign_in admin }

      it '編集ページが表示されること' do
        get :edit, id: article.id
        expect(assigns[:article]).to eq(article)
        expect(response).to be_success
      end
    end

    context '非ログイン管理者の場合' do
      it 'ログインページにリダイレクトされること' do
        get :edit, id: article.id
        expect(response).to redirect_to(new_admin_session_path)
      end
    end
  end

  describe 'PUT #update' do
    context 'ログイン管理者の場合' do
      before do
        sign_in admin
        article_attr.merge!({ admin_id: admin.id, title: 'update title' })
      end

      it 'Articleが更新されること' do
        put :update, id: article.id, article: article_attr
        expect(assigns[:article]).to eq(article)
        expect(flash.now[:notice]).to_not be_nil
        expect(response).to redirect_to(edit_article_path(article))
        expect(Phoga::Article.find(article.id).title).to eq('update title')
      end
    end

    context '非ログイン管理者の場合' do
      it 'ログインページにリダイレクトされること' do
        put :update, id: article.id
        expect(response).to redirect_to(new_admin_session_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'ログイン管理者の場合' do
      before { sign_in admin }

      it 'Articleの件数が1つ減ること' do
        expect{ delete :destroy, id: article.id }.
          to change(Phoga::Article, :count).by(-1)
      end

      it 'Articleを削除して一覧ページにリダイレクトされること' do
        delete :destroy, id: article.id
        expect(assigns[:article]).to eq(article)
        expect(flash.now[:notice]).to_not be_nil
        expect(response).to redirect_to(articles_path)
      end
    end

    context '非ログイン管理者の場合' do
      it 'ログインページにリダイレクトされること' do
        delete :destroy, id: article.id
        expect(response).to redirect_to(new_admin_session_path)
      end
    end
  end
end
