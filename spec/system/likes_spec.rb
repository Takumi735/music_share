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
      expect(page).to have_css("i.bi-heart", wait: 10)

      find("button").click
      expect(page).to have_css("i.bi-heart-fill", wait: 10)

      find("button").click
      expect(page).to have_css("i.bi-heart", wait: 10)
    end
  end
end
