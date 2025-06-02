# Music share - 音楽を投稿してシェア、コメントできるアプリ
<img width="1470" alt="スクリーンショット 2025-05-28 17 05 19" src="https://github.com/user-attachments/assets/0ca8085a-6769-4f21-876f-f3381d6fdb31" />

## アプリURL
https://musicshare-production.up.railway.app/

## サービス概要
音楽を検索して投稿でき、コメントができるサービスです。

## 開発理由
音楽を聴くとき自然と自分の趣向に合った曲を聴きがちですが、誰かが投稿した曲をタイムラインから曲を聴くことができます。  
また、好きな曲を語り合えるように投稿にコメントできる機能を実装しました。  
思っても見なかったジャンル、楽曲に出会うとことができ、好きな曲をユーザーと語り合えるそんなサービスがあったらいいなという思いで開発しました。

## 使用技術
### フロントエンド
- HTML
- CSS (SCSS)
- Bootstrap (CSSフレームワーク)
- Javascript (Turbo,Stimulus)

### バックエンド
- Ruby 3.3.3
- Ruby on rails 7.2.2

### データベース
- Mysql 9.3

### デプロイ・インフラ
- Railway
- Github Actions

## 主な機能

### ログイン・ログアウト
- ログイン機能(devise)
- ゲストログイン
- 登録情報編集
- トースト通知

### ホーム画面
- 投稿一覧降順で表示
- いいね機能
- 投稿の削除
- 無限スクロール

### サーチ画面
- Spotify APIを使った検索機能(Rspotify)
- アーティスト、曲の検索結果をタブで切り替え
- 無限スクロール

### 投稿画面
- 曲の選択画面モーダルで表示
- コメントのカウント機能
- 曲を選ぶまでボタンを無効

## ER図
![music_share drawio](https://github.com/user-attachments/assets/4fb3cba4-aad4-473a-b96a-0f7eae7a112a)

## 今後の展望
- ユーザーのプロフィール画像実装
- 投稿、コメントのリアルタイム更新
- タグ機能実装
