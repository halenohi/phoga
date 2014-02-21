# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category, :class => 'Phoga::Category' do
    sequence(:name) { |n| "Sample #{ n }" }
    sequence(:slug) { |n| "sample-#{ n }" }
    sequence(:position) { |n| n }
  end
end
