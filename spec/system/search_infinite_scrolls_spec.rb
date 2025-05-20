require "rails_helper"

RSpec.describe "検索ページの無限スクロール", type: :system, js: true do
  describe "アーティストタブ"
    it "無限スクロールでアーティスト検索結果が読み込まれる" do
      visit search_path(query: "a", search_type: "artist")

      expect(page).to have_selector(".artist-result-item", count: 20)

      2.times do |i|
        scroll_to(find("[data-controller='infinite-scroll']"))
        expect(page).to have_selector(".spinner-border", wait: 10)
        expect(page).to have_no_selector(".spinner-border", wait: 10)
      end

      puts page.html
      expect(page).to have_selector(".artist-result-item", count: 60)
    end

  describe "曲タブ"
    it "無限スクロールで曲検索結果が読み込まれる" do
      visit search_path(query: "a", search_type: "track")

      expect(page).to have_selector(".track-result-item", count: 20)

      2.times do
        scroll_to(find("[data-controller='infinite-scroll']"))
        expect(page).to have_selector(".spinner-border", wait: 10)
        expect(page).to have_no_selector(".spinner-border", wait: 10)
      end

      expect(page).to have_selector(".track-result-item", count: 60)
    end
  end
