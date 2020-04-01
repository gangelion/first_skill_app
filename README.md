## アプリタイトル
first_skill_app 
## URL
https://firstskillapp.com/
## 概要
メンターマッチングサイトMENTAのクローンサイトです。
## テストアカウント
- BASIC認証
  - ユーザー名 : 1111
  - パスワード : 1111
- メールアドレス : test@1
- パスワード : 11111111
  - 万が一テストユーザーが消えている場合はメールアドレスtest@＊でログインできます。(＊に数字を入れてください)
## 開発環境
- Docker 19.03.5
- CircleCI 2.0
- Ruby on Rails 5.2.4.1
- Ruby 2.5.1
- MySQL 5.6
- unicorn 5.4.1
- nginx 1.16.1
## 環境仕様
- Dockerによる開発環境構築
- CircleCIによる自動テスト（rubocop,siderによる自動コードレビュー）
- CircleCI,Capistranoによる自動デプロイ
- AWS(EC2,VPC,route53,Certificate Manager)
## アプリケーション仕様
- ユーザーサインイン・ログイン機能
- ユーザー編集、削除（退会）機能
- プラン投稿、編集、削除機能
- メッセージ送受信機能、返信機能
- ユーザーフォロー機能
- タグ機能
- 記事投稿、編集、削除機能
- メンター検索機能、タグ検索機能
- ページネーション機能
## DEMO
- TOPページ
![screencapture-18-178-33-110-2020-03-27-11_45_19](https://user-images.githubusercontent.com/59118646/77716042-8fad8700-7020-11ea-891f-1c31d4a766f0.png)

- メインページ
![screencapture-18-178-33-110-users-2020-03-27-11_47_18](https://user-images.githubusercontent.com/59118646/77716128-c71c3380-7020-11ea-9af3-06bf40f51129.png)

- プラン作成画面
![screencapture-localhost-3000-plans-new-2020-03-22-23_00_51](https://user-images.githubusercontent.com/59118646/77251322-0d743a00-6c91-11ea-8612-528cb9140112.png)

- メンター一覧画面
![screencapture-18-178-33-110-plans-new-arrival-mentor-2020-03-27-11_49_02](https://user-images.githubusercontent.com/59118646/77716237-06e31b00-7021-11ea-836b-e4d8af3224ca.png)

- メンタースキル絞り込み画面
![screencapture-18-178-33-110-plans-search-2020-03-27-11_50_31](https://user-images.githubusercontent.com/59118646/77716308-35f98c80-7021-11ea-8922-7dc72ebbee70.png)

- プラン詳細画面
![screencapture-18-178-33-110-plans-22-2020-03-25-15_44_53](https://user-images.githubusercontent.com/59118646/77509223-aed8d700-6eaf-11ea-88f1-f6b2957da28a.png)

- プロフィール画面
![screencapture-18-178-33-110-users-31-2020-03-25-15_38_31](https://user-images.githubusercontent.com/59118646/77508856-0591e100-6eaf-11ea-8fb0-88443e357b9f.png)

- 退会確認画面
![screencapture-localhost-3000-users-1-delete-confirm-2020-03-22-23_06_25](https://user-images.githubusercontent.com/59118646/77251478-e4a07480-6c91-11ea-8429-42c14f43bcef.png)

## なぜ作ったか
プログラミングやスキルを専門的に扱うサイトでもともと興味があったことと、アプリのイメージが掴みやすく、自分のスキルアップに繋がりそうだと感じたからです。