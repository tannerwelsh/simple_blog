class Array 
  def to_paragraph_tags
    join("<p></p>").prepend("<p>").concat("</p>")
  end
end

module ArticlesComments
  def self.populate_with_fakes
    10.times do
      article = Article.create(title: fake_title, body: fake_article_body)

      rand(5).times { article.comments.create(body: fake_comment) }
    end
  end

  def self.fake_title
    Faker::Lorem.words(rand(5) + 3).tap { |t| t.first.capitalize! }.join(' ')
  end

  def self.fake_article_body
    Faker::Lorem.paragraphs(rand(8) + 3).to_paragraph_tags
  end

  def self.fake_comment
    Faker::Lorem.paragraphs(rand(2) + 1).to_paragraph_tags
  end  
end

ArticlesComments.populate_with_fakes