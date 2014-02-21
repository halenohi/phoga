# coding: utf-8

FactoryGirl.define do
  factory :admin, class: 'Phoga::Admin' do
    sequence(:email) { |n| "sample-#{ n }@example.com" }
    password 'samplepass'
    password_confirmation 'samplepass'

    factory :saved_admin do
      after(:build) do |admin|
        admin.skip_confirmation!
      end
    end
  end
end
