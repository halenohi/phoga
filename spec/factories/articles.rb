# coding: utf-8

FactoryGirl.define do
  factory :article, class: 'Phoga::Article' do
    title 'Sample Title'
    body 'Sample Body'

    after(:build) do |article|
      if article.user_id.nil?
        user = FactoryGirl.build(:user)
        user.skip_confirmation!
        user.save!

        article.user_id = user.id
        article.save!
      end
    end
  end
end
