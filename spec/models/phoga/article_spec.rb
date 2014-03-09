# coding: utf-8
require 'spec_helper'

module Phoga
  describe Article do
    describe 'Validations' do
      let(:article) { FactoryGirl.build(:article) }

      describe 'admin_id' do
        it '必ず入力されていること' do
          article.admin_id = nil
          article.valid?
          expect(article.errors.has_key?(:admin_id)).to be
        end
      end
    end
  end
end
