This README would normally document whatever steps are necessary to get the
application up and running.
Things you may want to cover:
* Ruby version
* System dependencies
* Configuration
* Database creation
* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions
* ...
  
# DB設計
## usersテーブル（認証情報）
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|unique: true <!-- Emailアドレス -->
|nickname|string|null:false (ニックネーム）
|password|string|null:false (パスワード）
|avatar|string|| <!-- ユーザー画像 -->
|user_text|text|| <!-- 自己紹介文 -->
|sns_credential_id|references|foreign_key: true<!--api外部キー>
|first_name|string|null: false| <!-- 名前 -->
|last_name|string|null: false| <!-- 苗字 -->
|first_name_kana|string|null: false| <!-- 名前（カナ） -->
|last_name_kana|string|null: false| <!-- 苗字（カナ） -->
|phone_number|integer|null: false|unique: true| <!-- 電話番号 -->
|birthday|date|null: false| <!-- 誕生日 -->
### Association
- has_many :sns_credentials, dependent: :destroy
- has_many :items, dependent: :destroy
- has_many :comments dependent: :destroy
- has_many :item_likes dependent: :destroy
- has_one :address dependent: :destroy




## addressテーブル
|post_number|integer|null: false| <!-- 住所 -->
|prefectures_id|references|null:false|foreign_key: true<!--県>
|city|string|null: false| <!-- 市区町村 -->
|town|string|null: false| <!-- 番地 -->
|building|string|| <!-- 建物名 -->
### Association
- belongs_to :user
## sns_credentialsテーブル（API連携認証）
|Column|Type|Options|
|------|----|-------|
|provider|string|
|uid|string|
|user_id|references|foreign_key:true <!--外部キー>
### Association
- belongs_to :user






## commentsテーブル（製品コメント）
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false|foreign_key:true <!--外部キー  ユーザー-->
|comment|text|null: false| <!--コメント-->
|item_id|references|null: false|foreign_key:true <!--外部キー、売手-->
### Association
- belongs_to :item
- belongs_to :user





## item_likesテーブル（製品いいね）
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false|foreign_key:true <!--外部キー  アイテム-->
|user_id|references|null: false|foreign_key:true <!--外部キー、ユーザー-->
### Association
- belongs_to :item
- belongs_to :user





## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false| <!--カテゴリ名 -->
|ancestory|string|
### Association
- has_many :items




## item_imagesテーブル（アイテム写真群）
|Column|Type|Options|
|------|----|-------|
|image|string|null: false| <!--アイテム写真 -->
|items_id|references|null: false|foreign_key:true,
### Association
- belongs_to :item





## bcategoriesテーブル（ブランドのカテゴリー区分）
|Column|Type|Options|
|------|----|-------|
|name|string|null: false| <!-- ブランドのカテゴリー区分 -->¥
### Association
- has_many :bcategories_bcategories
- has_many :brands, through: :blands_bcategories






## brands_bcategoriesテーブル（ブランドカテゴリー中間テーブル）
|Column|Type|Options|
|------|----|-------|
|bcategorie_id|references|null: false|foreign_key:true,index:true <!-- 外部キーブランドカテゴリー名 -->
|brand_id|references|null: false| foreign_key:true,index:true<!-- 外部キーブランドカテゴリー名 -->
### Association
- belongs_to :brands
- belongs_to :bcategories







## brandsテーブル（ブランド）
|Column|Type|Options|
|------|----|-------|
|name|string|null: false| <!-- ブランド名 -->
### Association
- has_many :items
- has_many :brands_bcategories
- has_many :bcategories, through: :brands_bcategories





  
## itemsテーブル（商品情報）
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|index:true <!-- 商品名-->
|category_id|references|null: false|foreign_key: true <!-- 外部キー、カテゴリーID-->
|brand_id|references|foreign_key: true <!-- 外部キー、ブランド -->
|user_id|references|foreign_key: true <!-- 外部キー、個人 -->
|condition|string|null: false <!-- コンディション-->
|delivery_fee|string|null: false <!-- 配送料負担 -->
|delivery_method|string|null:false <!-- 配達方法 -->
|delivery_days|string|null: false <!-- 発送目安 -->
|price|string|null: false <!-- 価格 -->
|item_text|text|null: false <!-- 商品説明 -->
### Association
- has_many :item_images dependent: :destroy
- has_many :item_likes dependent: :destroy
- has_many :comments dependent: :destroy
- belongs_to :user
- belongs_to :category
- belongs_to :brand