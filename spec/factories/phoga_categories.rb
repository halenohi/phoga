# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :phoga_category, :class => 'Category' do
    name "MyString"
    slug "MyString"
    parent_id 1
    position 1
  end
end
