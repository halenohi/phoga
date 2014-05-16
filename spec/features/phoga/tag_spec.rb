require 'spec_helper'

feature 'phoga/tags' do
  let!(:admin) do
    admin = FactoryGirl.build(:admin)
    admin.skip_confirmation!
    admin.save!
    admin
  end
  let!(:tag) { FactoryGirl.create(:tag) }
  let(:tag_attr) { FactoryGirl.attributes_for(:tag) }

  background do
    login(admin.email, admin.password)
  end

  describe 'GET index' do
    before { visit tags_path }

    it '新規作成ボタンがあること' do
      expect(page).to have_selector(%Q/a[href="#{ new_tag_path }"]/)
    end

    it '編集ボタンが表示されること' do
      expect(page).to have_selector(%Q/a[href="#{ edit_tag_path(tag) }"]/)
    end
  end

  describe 'GET new' do
    before { visit new_tag_path }

    it 'nameのテキストフィールドが表示されること' do
      expect(page).to have_selector('input[name="tag[name]"]')
    end

    it '保存ボタンが表示されること' do
      expect(page).to have_selector('input[type="submit"]')
    end
  end

  describe 'GET edit' do
    before { visit edit_tag_path(tag) }

    it 'nameのテキストフィールドが表示されること' do
      expect(page).to have_selector('input[name="tag[name]"]')
    end

    it 'nameのテキストフィールドに正しいnameが表示されること' do
      expect(page).to have_selector(%Q/input[name="tag[name]"][value=#{ tag.name }]/)
    end

    it '保存ボタンが表示されること' do
      expect(page).to have_selector('input[type="submit"]')
    end

    it '削除ボタンが表示されること' do
      expect(page).to have_selector('a[data-method="delete"]')
    end
  end
end

