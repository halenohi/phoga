# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :custom_field, :class => 'Phoga::CustomField' do
    name "MyString"
    content "MyText"
    # image "MyString"
  end
end
