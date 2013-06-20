# coding: utf-8
require 'spec_helper'

describe Phoga::ArticlesController do
  include Devise::TestHelpers

  let!(:user) do
    user = FactoryGirl.build(:user)
    user.skip_confirmation!
    user.save!
    user
  end

  let!(:article) { FactoryGirl.create(:article) }
  let(:article_attr) { FactoryGirl.attributes_for(:article) }

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe 'GET #index' do
    context 'ログインユーザの場合' do
      before { sign_in user }

      it '一覧ページが表示されること' do
        get :index
        expect(assigns[:articles]).to eq([article])
        expect(response).to be_success
      end
    end

    context '非ログインユーザの場合' do
      it 'ログインページにリダイレクトされること' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #show' do
    context 'ログインユーザの場合' do
      before { sign_in user }

      it '個別ページが表示されること' do
        get :show, id: article.id
        expect(assigns[:article]).to eq(article)
        expect(response).to be_success
      end
    end

    context '非ログインユーザの場合' do
      it 'ログインページにリダイレクトされること' do
        get :show, id: article.id
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #new' do
    context 'ログインユーザの場合' do
      before { sign_in user }

      it '新規作成ページが表示されること' do
        get :new
        expect(assigns[:article]).to be_an_instance_of(Phoga::Article)
        expect(response).to be_success
      end
    end

    context '非ログインユーザの場合' do
      it 'ログインページにリダイレクトされること' do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST #create' do
    context 'ログインユーザの場合' do
      before do
        sign_in user
        article_attr.merge!({ user_id: user.id })
      end

      it 'Artistの件数が1つ増えること' do
        expect{ post :create, article: article_attr }.
          to change(Phoga::Article, :count).by(1)
      end

      it 'Article作成後に個別ページにリダイレクトされること' do
        post :create, article: article_attr
        expect(assigns[:article]).to be_an_instance_of(Phoga::Article)
        expect(flash.now[:notice]).to_not be_nil
        expect(response).to redirect_to(assigns[:article])
      end
    end

    context '非ログインユーザの場合' do
      it 'ログインページにリダイレクトされること' do
        get :create
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #edit' do
    context 'ログインユーザの場合' do
      before { sign_in user }

      it '編集ページが表示されること' do
        get :edit, id: article.id
        expect(assigns[:article]).to eq(article)
        expect(response).to be_success
      end
    end

    context '非ログインユーザの場合' do
      it 'ログインページにリダイレクトされること' do
        get :edit, id: article.id
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'PUT #update' do
    context 'ログインユーザの場合' do
      before do
        sign_in user
        article_attr.merge!({ user_id: user.id, title: 'update title' })
      end

      it 'Articleが更新されること' do
        put :update, id: article.id, article: article_attr
        expect(assigns[:article]).to eq(article)
        expect(flash.now[:notice]).to_not be_nil
        expect(response).to redirect_to(article)
        expect(Phoga::Article.find(article.id).title).to eq('update title')
      end
    end

    context '非ログインユーザの場合' do
      it 'ログインページにリダイレクトされること' do
        put :update, id: article.id
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'ログインユーザの場合' do
      before { sign_in user }

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

    context '非ログインユーザの場合' do
      it 'ログインページにリダイレクトされること' do
        delete :destroy, id: article.id
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
