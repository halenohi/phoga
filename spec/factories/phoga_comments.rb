# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment, :class => 'Phoga::Comment' do
    commentable_type "MyString"
    commentable_id 1
    author_email 'sample@example.com'
    body "MyText"
    published_at "2013-06-20 17:16:23"
    reply_to_id 1
  end
end
