## アプリタイトル
first_skill_app 
## URL
Elastic IP http://18.178.33.110/
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
- CapistranoによるAWSへの自動デプロイ
## アプリケーション仕様
- ユーザーサインイン・ログイン機能
- ユーザー編集、削除（退会）機能
- プラン投稿、編集、削除機能
- メッセージ送受信機能、返信機能
- ユーザーフォロー機能
- タグ機能
- 記事投稿、編集、削除機能
- メンター検索機能
## DEMO
- TOPページ
![screencapture-localhost-3000-2020-03-22-22_57_08](https://user-images.githubusercontent.com/59118646/77251232-93dc4c00-6c90-11ea-9f11-18be416dfa86.png)

- メインページ
![screencapture-localhost-3000-users-2020-03-22-22_59_14](https://user-images.githubusercontent.com/59118646/77251278-cede7f80-6c90-11ea-81da-a88e3fd515e2.png)

- プラン作成画面
![screencapture-localhost-3000-plans-new-2020-03-22-23_00_51](https://user-images.githubusercontent.com/59118646/77251322-0d743a00-6c91-11ea-8612-528cb9140112.png)

- メンター一覧画面
![screencapture-localhost-3000-plans-all-mentor-2020-03-23-00_29_29](https://user-images.githubusercontent.com/59118646/77253427-73ff5500-6c9d-11ea-9933-dd0272779a6c.png)

- メンタースキル絞り込み画面
![screencapture-localhost-3000-skills-2020-03-22-23_03_28](https://user-images.githubusercontent.com/59118646/77251384-6512a580-6c91-11ea-8742-d5227ee0ec77.png)

- プラン詳細画面
![screencapture-localhost-3000-plans-16-2020-03-22-23_05_37](https://user-images.githubusercontent.com/59118646/77251441-b327a900-6c91-11ea-9234-253cc59a7819.png)

- 退会確認画面
![screencapture-localhost-3000-users-1-delete-confirm-2020-03-22-23_06_25](https://user-images.githubusercontent.com/59118646/77251478-e4a07480-6c91-11ea-8429-42c14f43bcef.png)

## なぜ作ったか
プログラミングやスキルを専門的に扱うサイトでもともと興味があったことと、アプリのイメージが掴みやすく、自分のスキルアップに繋がりそうだと感じたからです。