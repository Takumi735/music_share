require 'rails_helper'

RSpec.describe "Search", type: :system, js: true do
  let(:user) { create(:user) }

  before do
    login_as(user)
  end

  describe "Spotify検索機能" do
    it "アーティストを検索できる" do
      visit search_path(search_type: "artist")
      click_link "アーティスト"

      fill_in "曲を検索", with: "Aimer"
      find("input[placeholder='曲を検索']").send_keys(:enter)

      expect(page).to have_selector(".artist-result-item", text: "Aimer")
    end

    it "曲を検索できる" do
      visit search_path(search_type: "track")
      click_link "曲"

      fill_in "曲を検索", with: "Pretender"
      find("input[placeholder='曲を検索']").send_keys(:enter)

      expect(page).to have_selector(".track-result-item", text: "Pretender")
    end
  end

  describe "Spotify検索複数表示" do
    it "アーティストが複数表示される" do
      visit search_path(search_type: "artist")

      fill_in "曲を検索", with: "a"
      find("input[placeholder='曲を検索']").send_keys(:enter)

      expect(page).to have_selector(".artist-result-item", minimum: 5)
    end

    it "曲が複数表示される" do
      visit search_path(search_type: "track")

      fill_in "曲を検索", with: "a"
      find("input[placeholder='曲を検索']").send_keys(:enter)

      expect(page).to have_selector(".track-result-item", minimum: 5)
    end
  end
end
