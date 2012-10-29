require 'spec_helper'

describe CommentsController do
  # This should return the minimal set of attributes required to create a valid
  # Comment. As you add validations to Comment, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { body: "Comment text" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CommentsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  let(:article) { Article.create(title: "Sample article", body: "Some random article") }
  let(:comment) { article.comments.build(valid_attributes)}

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Comment" do
        expect {
          comment.save
        }.to change(Comment, :count).by(1)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested comment" do
      comment.save
      expect {
        comment.destroy
      }.to change(Comment, :count).by(-1)
    end
  end

end
