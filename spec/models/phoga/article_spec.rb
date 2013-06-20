# coding: utf-8
require 'spec_helper'

module Phoga
  describe Article do
    describe 'Validations' do
      let(:article) { FactoryGirl.build(:article) }

      describe 'user_id' do
        it '必ず入力されていること' do
          article.user_id = nil
          article.valid?
          expect(article.errors.has_key?(:user_id)).to be
        end
      end
    end
  end
end
