# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tag, class: 'Phoga::Tag' do
   sequence(:name) { |n| "sample-name-#{ n }" }
  end
end
