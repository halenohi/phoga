if Phoga::User.count == 0
  user = Phoga::User.new({
    email: 'sample@example.com',
    password: 'samplepass',
    password_confirmation: 'samplepass'
  })
  user.skip_confirmation!
  user.save!
  puts user.inspect
end

if Phoga::Article.count == 0
  article = Phoga::Article.new({
    title: 'Sample Title',
    body: 'sample article body...',
    user_id: Phoga::User.count != 0 ? 1 : nil
  })
  article.save!
  puts article.inspect
end

if Phoga::Tag.count == 0
  article = Phoga::Article.find(1)
  (1..3).each do |n|
    tag = Phoga::Tag.create({
      name: "sample tag #{ n }"
    })
    puts tag.inspect
    article.taggings.create({ tag_id: tag.id })
    puts article.taggings.inspect
  end
end

if Phoga::Comment.count == 0
  article = Phoga::Article.find(1)
  comment = article.comments.create({
    author_name: 'sample name',
    author_email: 'sample@example.com',
    body: 'sample comment body'
  })
  comment.publish!
  puts comment.inspect
end

if Phoga::Category.count == 0
  article = Phoga::Article.find(1)
  category = Phoga::Category.create({
    name: 'sample category',
    slug: 'sample-category'
  })
  puts category.inspect
  child_category = Phoga::Category.create({
    name: 'sample child category',
    slug: 'sample-child-category',
    parent_id: category.id
  })
  puts child_category.inspect
  categorization = article.categorizations.create({ category_id: child_category.id })
  puts categorization.inspect
end


if Phoga::CustomField.count == 0
  article = Phoga::Article.find(1)
  custom_field = Phoga::CustomField.create({
    name: 'sample custom field',
    content: 'sample custom field content'
  })
  puts custom_field.inspect
  article.custom_field_assignments.create({ custom_field_id: custom_field.id })
  puts article.custom_field_assignments.inspect
end