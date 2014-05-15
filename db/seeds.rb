if Phoga::Admin.count == 0
  admin = Phoga::Admin.new({
    email: 'sample@example.com',
    password: 'samplepass',
    password_confirmation: 'samplepass'
  })
  admin.skip_confirmation!
  admin.save!
  puts admin.inspect
end

if Phoga::Article.count == 0
  article = Phoga::Article.new({
    title: 'Sample Title',
    content: 'sample article body...',
    admin_id: Phoga::Admin.count != 0 ? 1 : nil
  })
  article.save!
  puts article.inspect
end

if Phoga::Tag.count == 0
  article = Phoga::Article.find(1)
  (1..3).each do |n|
    tag = Phoga::Tag.create({
      name: "sample tag #{ n }",
      slug: "sample_tag_#{ n }"
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
    name: 'Other',
    slug: 'other'
  })
  puts category.inspect
  categorization = article.categorizations.create({ category_id: category.id })
  puts categorization.inspect
end


if Phoga::CustomField.count == 0
  article = Phoga::Article.find(1)
  article.custom_fields << Phoga::CustomField.new({
    name: 'sample custom field',
    content: 'sample custom field content'
  })
  article.save!
  puts article.custom_fields
end
