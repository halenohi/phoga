# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tagging, class: 'Phoga::Tagging' do
    article
    tag
  end

  factory :tagging_for_attr, class: 'Phoga::Tagging' do
    tag
  end
end
