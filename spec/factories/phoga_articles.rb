# coding: utf-8

FactoryGirl.define do
  factory :article, class: 'Phoga::Article' do
    title 'Sample Title'
    body 'Sample Body'
    admin { FactoryGirl.create(:saved_admin) }
  end
end
