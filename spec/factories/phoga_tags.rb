# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :phoga_tag, :class => 'Tag' do
    name "MyString"
  end
end
