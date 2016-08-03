100.times do
  user = User.create(
    username: Faker::Internet.user_name(nil, %w(-)),
    password: 'playground',
    email: Faker::Internet.email,
    bio: Faker::Lorem.paragraphs(1).first
  )
  puts user.inspect
  if user.persisted?
    10.times do
      post = user.posts.create(
        title: Faker::Book.title,
        body: Faker::Lorem.paragraphs(10).join("\n\n")
        )
        puts post.inspect
    end
  end

end
