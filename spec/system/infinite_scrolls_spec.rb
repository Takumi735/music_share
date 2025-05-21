require "rails_helper"

RSpec.describe "ページネーションを使った無限スクロール", type: :system, js: true do
  let(:user) { create(:user) }

  describe "投稿一覧の無限スクロール" do
    before do
      30.times do |i|
        create(:post, user: user, content: "Post #{i}", created_at: i.minutes.ago)
      end
      visit posts_path
    end

    it "最初に10件の投稿が表示される" do
      expect(page).to have_selector(".card", count: 10)
    end

    it "スクロールすると投稿が追加で読み込まれる" do
      2.times do |i|
        scroll_to(find("[data-controller='infinite-scroll']"))
        expected_count = 10 * (i + 2)
        expect(page).to have_selector(".card", count: expected_count)
      end
    end
  end

  describe "コメントの無限スクロール" do
    before do
      post = create(:post, user:)
      60.times do |i|
        create(:comment, post:, user:, content: "Comment #{i}", created_at: i.minutes.ago)
      end
      visit post_path(post)
    end

    it "最初に20件のコメントが表示される" do
      expect(page).to have_selector(".comment-container", count: 20)
    end

    it "スクロールするとコメントが追加で読み込まれる" do
      2.times do |i|
        scroll_to(find("[data-controller='infinite-scroll']"))
        expected_count = 20 * (i + 2)
        expect(page).to have_selector(".comment-container", count: expected_count)
      end
    end
  end
end
