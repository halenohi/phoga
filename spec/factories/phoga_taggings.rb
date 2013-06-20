# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :phoga_tagging, :class => 'Tagging' do
    taggable_type "MyString"
    taggable_id 1
    tag_id 1
  end
end
