require 'spec_helper'

describe Phoga::TagsController do
  prepare_admin

  let!(:tag) { FactoryGirl.create(:tag) }
  let(:tag_attr) { FactoryGirl.attributes_for(:tag) }

  describe 'GET index' do
    context 'ログイン済の場合' do
      before { sign_in admin }

      it '一覧ページが表示されること' do
        get :index
        expect(assigns[:tags]).to eq([tag])
        expect(response).to be_success
      end
    end

    context 'ログイン済みでない場合' do
      it 'ログインページにリダイレクトされること' do
        get :index
        expect(response).to redirect_to(new_admin_session_path)
      end
    end
  end

  describe 'GET new' do
    context 'ログイン済みの場合' do
      it '新規作成ページが表示されること' do
        get :new
        expect(assigns[:tag]).to be_an_instance_of(Phoga::Tag)
        expect(response).to be_success
      end
    end

    context 'ログイン済みでない場合' do
      it 'ログインページにリダイレクトされること' do
        get :new
        expect(response).to redirect_to(new_admin_session_path)
      end
    end
  end

  describe 'POST create' do
    context 'ログイン済みの場合' do
      it 'Phoga::Tagの件数が1つ増えること' do
        expect{ post :create, tag: tag_attr }.
          to change(Phoga::Tag, :count).by(1)
      end
    end

    context 'ログイン済みでない場合' do
      it 'ログインページにリダイレクトされること' do
        post :create, tag: tag_attr
        expect(response).to redirect_to(new_admin_session_path)
      end
    end
  end

  describe 'GET edit' do
    context 'ログイン済みの場合' do
      it '編集ページが表示されること' do
        get :edit, id: tag.id
        expect(response).to be_success
      end
    end

    context 'ログイン済みでない場合' do
      it 'ログインページにリダイレクトされること' do
        get :edit, id: tag.id
        expect(response).to redirect_to(new_admin_session_path)
      end
    end
  end

  describe 'PUT update' do
    context 'ログイン済みの場合' do
      it '' do
        
      end
    end

    context 'ログイン済みでない場合' do
      it 'ログインページにリダイレクトされること' do
        
      end
    end
  end

  describe 'DELETE destroy' do
    context 'ログイン済みの場合' do
      it '' do
        
      end
    end

    context 'ログイン済みでない場合' do
      it 'ログインページにリダイレクトされること' do
        
      end
    end
  end
end
