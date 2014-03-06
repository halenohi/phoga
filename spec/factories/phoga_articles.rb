# coding: utf-8

FactoryGirl.define do
  factory :article, class: 'Phoga::Article' do
    title 'Sample Title'
    content 'Sample Content'
    admin_id FactoryGirl.create(:saved_admin).id

    after(:create) do |article|
      2.times do
        article.categorizations.create({ category: FactoryGirl.create(:category) })
      end
    end
  end
end
