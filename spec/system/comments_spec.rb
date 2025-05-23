require 'rails_helper'

RSpec.describe "コメント機能", type: :system do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }

  describe "ログインユーザーの場合" do
    before do
      login_as(user)
      visit post_path(post)
    end

      it "コメントを投稿できる" do
        fill_in "コメントを入力...", with: "これはテストコメントです"
        click_button "コメントを投稿"

        expect(page).to have_content("これはテストコメントです")
        expect(page).to have_content(user.name)
      end

      it "空コメントでは投稿できず、エラーが表示される" do
        click_button "コメントを投稿"

        I18n.t("activerecord.errors.models.comment.attributes.content.blank")
      end

      it "300文字を超えた場合投稿できず、エラーが表示される" do
        long_comment = "あ" * 301
        fill_in "コメントを入力...", with: long_comment
        click_button "コメントを投稿"

        I18n.t("activerecord.errors.models.comment.attributes.content.too_long")
      end
  end

  describe "未ログインユーザーの場合" do
    it "コメントフォームが表示されない" do
      visit post_path(post)

      expect(page).to have_content("コメントするにはログインしてください。")
    end
  end
end
