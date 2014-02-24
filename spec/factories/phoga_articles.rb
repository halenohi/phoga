# coding: utf-8

FactoryGirl.define do
  factory :article, class: 'Phoga::Article' do
    title 'Sample Title'
    content 'Sample Content'
    admin { FactoryGirl.create(:saved_admin) }

    after(:build) do |article|
      2.times do
        category = FactoryGirl.create(:categorization, {
          article: article,
          category: FactoryGirl.create(:category)
        })
        article.categorizations.push(category)
      end
    end
  end
end
