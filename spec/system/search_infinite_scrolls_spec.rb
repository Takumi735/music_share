require "rails_helper"

RSpec.describe "検索ページの無限スクロール", type: :system, js: true do
  describe "アーティストタブ" do
    before do
      visit search_path(query: "a", search_type: "artist")
    end

    it "アーティストタブで最初10件以上表示される" do
      expect(page).to have_selector(".artist-result-item",  minimum: 10)
    end

    it "スクロールするとアーティストが追加で読み込まれる" do
      scroll_to(find("[data-controller='infinite-scroll']"))
      expect(page).to have_selector(".artist-result-item", minimum: 30)
    end
  end

  describe "曲タブ" do
    before do
      visit search_path(query: "a", search_type: "track")
    end

    it "曲タブで最初に10件以上表示される" do
      expect(page).to have_selector(".track-result-item",  minimum: 10)
    end

    it "スクロールすると曲が追加で読み込まれる" do
      scroll_to(find("[data-controller='infinite-scroll']"))
      expect(page).to have_selector(".track-result-item", minimum: 30)
    end
  end
end
