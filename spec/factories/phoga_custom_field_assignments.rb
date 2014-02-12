# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :custom_field_assignment, class: 'Phoga::CustomFieldAssignment' do
    assignable_type "MyString"
    assignable_id 1
    custom_field_id 1
  end
end
