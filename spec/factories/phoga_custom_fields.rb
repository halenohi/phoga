# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :phoga_custom_field, :class => 'CustomField' do
    name "MyString"
    content "MyText"
    image "MyString"
  end
end
