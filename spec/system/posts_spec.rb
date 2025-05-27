require 'rails_helper'

RSpec.describe "Posts", type: :system do
  let(:user) { create(:user) }
  let!(:post) { create(:post, user: user) }

  before do
    login_as(user)
  end

  describe "投稿機能", js: true do
    it "モーダルで曲を検索して投稿できる" do
      visit new_post_path

      click_button "変更"
      expect(page).to have_selector(".modal", visible: true)

      fill_in "曲名を入力してください", with: "Pretender"
      click_button "検索"

      expect(page).to have_selector(".track-result-item", text: "Pretender")

      within ".modal" do
        find(".track-result-item", text: "Pretender", match: :first).click
      end

      expect(page).to have_no_selector(".modal", visible: true)

      fill_in "音楽の感想や思い出を書いてみましょう", with: "いい曲です"
      click_button "投稿"

      expect(page).to have_content("いい曲です")
    end

    it "投稿を削除できる" do
      visit root_path

      find(".post-menu-button").click
      click_on "削除"

      expect(page).to have_content("投稿を削除しました")
    end
  end
end
