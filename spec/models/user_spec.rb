require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーション" do
    it "有効なユーザーであること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "名前がないと無効であること" do
      user = build(:user, name: nil)
      expect(user).to_not be_valid
      expect(user.errors[:name]).to be_present
    end

    it "メールアドレスがないと無効であること" do
      user = build(:user, email: nil)
      expect(user).to_not be_valid
    end

    it "パスワードが6文字未満だと無効であること" do
      user = build(:user, password: "12345", password_confirmation: "12345")
      expect(user).to_not be_valid
    end
  end

  describe "アソシエーション" do
    it { should have_many(:posts).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
    it { should have_many(:liked_posts).through(:likes).source(:post) }
    it { should have_many(:comments).dependent(:destroy) }
  end
end
