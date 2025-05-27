require 'rails_helper'

RSpec.describe "Authentications", type: :system do
  let(:user) { create(:user) }

  describe "新規登録" do
    it "ユーザーが新規登録できること" do
      new_user = build(:user)
      visit new_user_registration_path

      fill_in "Name", with: new_user.name
      fill_in "Email address", with: new_user.email
      fill_in "Password", with: new_user.password
      click_button "新規登録"

      expect(page).to have_content("アカウント登録が完了しました。")
    end
  end

  describe "ログインとログアウト" do
    it "既存ユーザーがログイン・ログアウトできること" do
      visit new_user_session_path

      fill_in "Email address", with: user.email
      fill_in "Password", with: user.password

      click_button "ログイン"
      expect(page).to have_content("ログインに成功しました")
      expect(page).to have_current_path(root_path)

      click_link "ログアウト"
      expect(page).to have_content("ログアウトしました")
      expect(page).to have_current_path(root_path)
    end
  end

  describe "マイページとユーザー情報編集" do
    before do
      login_as(user)
    end

    it "マイページのアカウント情報が表示されること" do
      visit mypage_path(tab: "account")

      expect(page).to have_content("メールアドレス")
      expect(page).to have_content(user.email)
      expect(page).to have_content("ユーザー名")
      expect(page).to have_content(user.name)
      expect(page).to have_link("編集する", href: edit_user_registration_path)
    end

    it "ユーザー名を変更できること" do
      visit edit_user_registration_path

      fill_in "ユーザー名", with: "変更後ユーザー名"
      fill_in "現在のパスワード", with: user.password
      fill_in "新しいパスワード", with: "new_password123"
      click_button "更新する"

      expect(page).to have_content("アカウント情報を更新しました")
      expect(page).to have_current_path(root_path)
    end
  end
end
