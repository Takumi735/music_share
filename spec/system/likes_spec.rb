require 'rails_helper'

RSpec.describe "Like", type: :system do
  let(:user) { create(:user) }
  let!(:post) { create(:post, user: user) }

  before do
    login_as(user)
    visit root_path
  end

  it "いいねを非同期で追加・削除できる", js: true do
    within "[data-like-toggle-post-id-value='#{post.id}']" do
      icon = find("i[data-like-toggle-target='icon']")

      expect(icon[:class]).to include("bi-heart")
      expect(icon[:class]).not_to include("bi-heart-fill")

      find("button").click

      expect(page).to have_css("i.bi-heart-fill")
      icon = find("i[data-like-toggle-target='icon']")
      puts icon[:class]

      find("button").click

      expect(page).to have_css("i.bi-heart")
    end
  end
end
