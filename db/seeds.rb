require "faker"

# limpio las tablas
User.destroy_all
Post.destroy_all
Comment.destroy_all

# creo 20 usuarios con emails y contraseñas únicas
users = 20.times.map do
  User.create!(
    email: Faker::Internet.unique.email,
    password: Faker::Internet.unique.password(min_length: 6, max_length: 8),
    admin: false
  )
end

# creo 50 posts con títulos y contenidos únicos
posts = 50.times.map do
  Post.create!(
    title: Faker::Hipster.unique.sentences(number: 1),
    content: Faker::Hipster.unique.paragraph(sentence_count: 10),
    available: [true, false].sample
  )
end

# creo 100 comentarios con contenido único
100.times do
  Comment.create!(
    content: Faker::Hipster.unique.sentence(word_count: 10),
    user: users.sample,
    post: posts.sample
  )
end

puts "Se han creado #{User.count} usuarios, #{Post.count} posts y #{Comment.count} comentarios."
