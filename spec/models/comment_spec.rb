require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "バリデーション" do
    it "有効なファクトリを持つこと" do
      comment = build(:comment)
      expect(comment).to be_valid
    end

    it "contentがないと無効であること" do
      comment = build(:comment, content: nil)
      expect(comment).to_not be_valid
      expect(comment.errors.details[:content]).to include(error: :blank)
    end

    it "contentが300文字を超えると無効であること" do
      comment = build(:comment, content: "あ" * 301)
      expect(comment).to_not be_valid
      expect(comment.errors.details[:content]).to include(error: :too_long, count: 300)
    end
  end

  describe "アソシエーション" do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end
end
