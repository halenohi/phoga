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
