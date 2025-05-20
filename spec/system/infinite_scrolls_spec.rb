require "rails_helper"

RSpec.describe "ページネーションを使った無限スクロール", type: :system, js: true do
  let(:user) { create(:user) }

  describe "投稿一覧の無限スクロール" do
    before do
      60.times do |i|
        create(:post, user: user, content: "Post #{i}", created_at: i.minutes.ago)
      end
      visit posts_path
    end

    it "最初に20件の投稿が表示される" do
      expect(page).to have_selector(".card", count: 20)
    end

    it "スクロールすると投稿が追加に読み込まれる" do
      2.times do
        scroll_to(find("[data-controller='infinite-scroll']"))
        expect(page).to have_selector(".spinner-border", wait: 10)
        expect(page).to have_no_selector(".spinner-border", wait: 10)
      end

      expect(page).to have_selector(".card", count: 60)
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

    it "スクロールするとコメントが追加に読み込まれる" do
      2.times do
        scroll_to(find("[data-controller='infinite-scroll']"))
        expect(page).to have_selector(".spinner-border", wait: 10)
        expect(page).to have_no_selector(".spinner-border", wait: 10)
      end

      expect(page).to have_selector(".comment-container", count: 60)
    end
  end
end
