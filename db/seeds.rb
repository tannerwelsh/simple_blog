def Article::fake_title
  Faker::Lorem.words(rand(5) + 3).tap { |t| t.first.capitalize! }.join(' ')
end

def Article::fake_body
  Faker::Lorem.paragraphs(rand(8) + 3).join("<p></p>").prepend("<p>").concat("</p>")
end

10.times do
  Article.create(title: Article.fake_title, body: Article.fake_body)
end