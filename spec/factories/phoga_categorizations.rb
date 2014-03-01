# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :categorization, class: 'Phoga::Categorization' do
    article
    category
  end

  factory :categorization_for_attr, class: 'Phoga::Categorization' do
    category
  end
end
