# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :categorization, class: 'Phoga::Categorization' do
    categorizable_type "MyString"
    categorizable_id 1
    category_id 1
  end
end
