# coding: utf-8

FactoryGirl.define do
  factory :user, class: 'Phoga::User' do
    sequence(:email) { |n| "sample-#{ n }@example.com" }
    password 'samplepass'
    password_confirmation 'samplepass'
  end
end
