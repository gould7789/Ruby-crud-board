# Rails CRUD Board (掲示板アプリケーション)

Ruby on Railsの学習用に開発した**CRUD機能付き掲示板アプリケーション**です。
基本的な投稿機能（作成、閲覧、編集、削除）を実装し、**Bootstrap 5**を使用してUIを構築しました。

---

## Tech Stack (使用技術)

* **Framework**: Ruby on Rails
* **Language**: Ruby
* **Frontend**: ERB, Bootstrap
* **Database**: PostgreSQL
* **IDE**: VS Code

---

## Key Features (主な機能)

### 1. 掲示板の基本機能 (CRUD)
* **Create (作成)**: 新規投稿の作成。
* **Read (閲覧)**: 全投稿の一覧表示（**最新順**にソート）および詳細表示。
* **Update (編集)**: 既存の投稿内容の修正。
* **Delete (削除)**: 投稿の削除（Turbo Confirmによる確認アラート付き）。

### 2. UI/UX デザイン
* **Bootstrap 5 適用**: Navbar、Card、Button、Tableなどのコンポーネントを活用し、モダンなデザインを構築。
* **レスポンシブ対応**: Grid System (`col-lg-8` 等) を使用し、PCとモバイルの両方に対応。
* **可読性の向上**: `simple_format` ヘルパーを使用し、改行を含む長文も適切に表示。また、タイポグラフィも見やすく設定。

### 3. 機能強化・詳細設定
* **バリデーション (Validation)**:
    * タイトル：必須入力。
    * 内容：必須入力、かつ最小文字数制限（5文字以上）。
    * エラー発生時、Bootstrapのアラート機能で直感的なフィードバックを表示。
* **国際化 (I18n)**:
    * デフォルト言語を韓国語(`ko`)に設定。
    * エラーメッセージや時刻表示フォーマットを現地の情緒に合わせてローカライズ（`ko.yml`）。
    * 助詞の処理（"は/が"など）を自然な表現に修正。
* **タイムゾーン (Timezone)**:
    * サーバー時間を `Seoul` (UTC+09:00) に設定し、作成日時を正確に表示。

---

## Architecture & Database (設計・構造)

### 1. Database Schema
<img width="300" height="300" alt="image" src="https://github.com/user-attachments/assets/6307449c-e7e9-4b3e-9a8e-dc28a8d0713d" />

### 2. Data Flow (処理フロー)
ユーザーが「新規投稿」を行い、保存されるまでのMVC（Model-View-Controller）の処理フローです。
<img width="1331" height="847" alt="flow" src="https://github.com/user-attachments/assets/bbe7874d-067a-4999-86bd-9ad1655553e3" />

---

## Screen Shots (実行画面)

### 1. メイン一覧ページ (Index)
> シンプルなテーブルデザインと、最新順のソート機能。

<img width="1331" height="847" alt="index" src="https://github.com/user-attachments/assets/13296921-0381-458c-ab0d-0d66619ab6cd" />

### 2. 新規投稿ページ (New)
> カード型の入力フォームと、バリデーションエラー表示。

<img width="1331" height="847" alt="new" src="https://github.com/user-attachments/assets/0c5d6f7a-3c0f-43f0-83bb-ff893d7d0f32" />

### 3. 詳細ページ (Show)
> 読みやすいレイアウトと、下部に配置された管理ボタン。

<img width="1331" height="847" alt="show" src="https://github.com/user-attachments/assets/606ebccd-1b64-4ea4-bdfc-ed3e3b005ebb" />

---

## Project Structure (主要ディレクトリ構成)

* **Controller**: `posts_controller.rb` - 最新順ソート(`order(created_at: :desc)`) および CRUDアクションの処理。
* **Model**: `post.rb` - `validates` を使用したデータの整合性チェック。
* **View**:
    * `layouts/application.html.erb`: Navbarおよび全体のレイアウト設定。
    * `posts/new.html.erb`: `form_with` と Bootstrap Form を組み合わせた入力UI。
* **Config**: `application.rb` (Timezone設定), `locales/ko.yml` (韓国語翻訳ファイル)。

---

## How to Run (実行方法)

```bash
# 1. リポジトリのクローン
git clone [リポジトリのURL]

# 2. Gemのインストール
bundle install

# 3. データベースのマイグレーション
rails db:migrate

# 4. サーバーの起動
./bin/dev
# または
rails s
