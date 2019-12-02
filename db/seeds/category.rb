#レディースブロック

#レディースの子カテゴリー配列
lady_child_array = ['トップス','ジャケット/アウター','パンツ','スカート','ワンピース','靴','ルームウェア/パジャマ','レッグウェア','帽子','バッグ','アクセサリー','ヘアアクセサリー','小物','時計','ウィッグ/エクステ','浴衣/水着','スーツ/フォーマル/ドレス','マタニティ','その他']
#レディースの孫カテゴリー配列
lady_grandchild_array = 
[
  ['すべて','Tシャツ/カットソー(半袖/袖なし)','Tシャツ/カットソー(七分/長袖)','シャツ/ブラウス(半袖/袖なし)','シャツ/ブラウス(七分/長袖)','ポロシャツ','キャミソール','タンクトップ','ホルターネック','ニット/セーター','チュニック','カーディガン/ボレロ','アンサンブル','ベスト/ジレ','パーカー','トレーナー/スウェット','ベアトップ/チューブトップ','ジャージ','その他'], 
  ['すべて','テーラードジャケット','ノーカラージャケット','Gジャン/デニムジャケット','レザージャケット','ダウンジャケット','ライダースジャケット','ミリタリージャケット','ダウンベスト','ジャンパー/ブルゾン','ポンチョ','ロングコート','トレンチコート','ダッフルコート','ピーコート','チェスターコート','モッズコート','スタジャン','毛皮/ファーコート','スプリングコート','スカジャン','その他'],
  ['すべて','デニム/ジーンズ','ショートパンツ','カジュアルパンツ','ハーフパンツ','チノパン','ワークパンツ/カーゴパンツ','クロップドパンツ','サロペット/オーバーオール','オールインワン','サルエルパンツ','ガウチョパンツ','その他'], 
  ['すべて','ミニスカート','ひざ丈スカート','ロングスカート','キュロット','その他'],
  ['すべて','ミニワンピース','ひざ丈ワンピース','ロングワンピース','その他'], 
  ['すべて','ハイヒール/パンプス','ブーツ','サンダル','スニーカー','ミュール','モカシン','ローファー/革靴','フラットシューズ/バレエシューズ','長靴/レインシューズ','その他'], 
  ['すべて','パジャマ','ルームウェア'], 
  ['すべて','ソックス','スパッツ/レギンス','ストッキング/タイツ','レッグウォーマー','その他'], 
  ['すべて','ニットキャップ/ビーニー','ハット','ハンチング/ベレー帽','キャップ','キャスケット','麦わら帽子','その他'], 
  ['すべて','ハンドバッグ','トートバッグ','エコバッグ','リュック/バックパック','ボストンバッグ','スポーツバッグ','ショルダーバッグ','クラッチバッグ','ポーチ/バニティ','ボディバッグ/ウェストバッグ','マザーズバッグ','メッセンジャーバッグ','ビジネスバッグ','旅行用バッグ/キャリーバッグ','ショップ袋','和装用バッグ','かごバッグ','その他'], 
  ['すべて','ネックレス','ブレスレット','バングル/リストバンド','リング','ピアス(片耳用)','ピアス(両耳用)','イヤリング','アンクレット','ブローチ/コサージュ','チャーム','その他'], 
  ['すべて','ヘアゴム/シュシュ','ヘアバンド/カチューシャ','ヘアピン','その<e4><bb><96>'],
  ['すべて','長財布','折り財布','コインケース/小銭入れ','名刺入れ/定期入れ','キーケース','キーホルダー','手袋/アームカバー','ハンカチ','ベルト','マフラー/ショール','ストール/スヌード','バンダナ/スカーフ','ネックウォーマー','サスペンダー','サングラス/メガネ','モバイルケース/カバー','手帳','イヤマフラー','傘','レインコート/ポンチョ','ミラー','タバコグッズ','その他'], 
  ['すべて','腕時計(アナログ)','腕時計(デジタル)','ラバーベルト','レザーベルト','金属ベルト','その他'], 
  ['すべて','前髪ウィッグ','ロングストレート','ロングカール','ショートストレート','ショートカール','その他'],
  ['すべて','浴衣','着物','振袖','長襦袢/半襦袢','水着セパレート','水着ワンピース','水着スポーツ用','その他'], 
  ['すべて','スカートスーツ上下','パンツスーツ上下','ドレス','パーティーバッグ','シューズ','ウェディング','その他'], 
  ['すべて','トップス','アウター','インナー','ワンピース','パンツ/スパッツ','スカート','パジャマ','授乳服','その他'], 
  ['すべて','コスプレ','下着','その他']
]

Category.create(name: '---')

parent = Category.create(name: 'レディース')

lady_child_array.each_with_index do |child_name, i|
  child = parent.children.create(name: child_name)
  lady_grandchild_array[i].each do |grandchild|
   child.children.create(name: grandchild)
 end
end

#メンズブロック

#メンズの子カテゴリー配列
mens_child_array = ['トップス','ジャケット/アウター','パンツ','靴','バッグ','スーツ','帽子','アクセサリー','小物','時計','水着','レッグウェア','アンダーウェア','その他',]
#メンズの孫カテゴリー配列
mens_grandchild_array = 
[
  ['すべて','Tシャツ/カットソー(半袖/袖なし)','Tシャツ/カットソー(七分/長袖)','シャツ','ポロシャツ','タンクトップ','ニット/セーター','パーカー','カーディガン','スウェット','ジャージ','ベスト','その他'], 
  ['すべて','テーラードジャケット','ノーカラージャケット','Gジャン/デニムジャケット','レザージャケット','ダウンジャケット','ライダースジャケット','ミリタリージャケット','ナイロンジャケット','フライトジャケット','ダッフルコート','ピーコート','ステンカラーコート','トレンチコート','モッズコート','チェスターコート','スタジャン','スカジャン','ブルゾン','マウンテンパーカー','ダウンベスト','ポンチョ','カバーオール','その他'],
  ['すべて','デニム/ジーンズ','ワークパンツ/カーゴパンツ','スラックス','チノパン','ショートパンツ','ペインターパンツ','サルエルパンツ','オーバーオール','その他'], 
  ['すべて','スニーカー','サンダル','ブーツ','モカシン','ドレス/ビジネス','長靴/レインシューズ','デッキシューズ','その他'], 
  ['すべて','ショルダーバッグ','トートバッグ','ボストンバッグ','リュック/バックパック','ウエストポーチ','ボディーバッグ','ドラムバッグ','ビジネスバッグ','トラベルバッグ','メッセンジャーバッグ','エコバッグ','その他'], 
  ['すべて','スーツジャケット','スーツベスト','スラックス','セットアップ','その他'], 
  ['すべて','キャップ','ハット','ニットキャップ/ビーニー','ハンチング/ベレー帽','キャスケット','サンバイザー','その他'], 
  ['すべて','ネックレス','ブレスレット','バングル/リストバンド','リング','ピアス(片耳用)','ピアス(両耳用)','アンクレット','その他'], 
  ['すべて','長財布','折り財布','マネークリップ','コインケース/小銭入れ','名刺入れ/定期入れ','キーケース','キーホルダー','ネクタイ','手袋','ハンカチ','ベルト','マフラー','ストール','バンダナ','ネックウォーマー','サスペンダー','ウォレットチェーン','サングラス/メガネ','モバイルケース/カバー','手帳','ストラップ','ネクタイピン','カフリンクス','イヤマフラー','傘','レインコート','ミラー','タバコグッズ','その他'], 
  ['すべて','腕時計(アナログ)','腕時計(デジタル)','ラバーベルト','レザーベルト','金属ベルト','その他'], 
  ['すべて','一般水着','スポーツ用','アクセサリー','その他'], 
  ['すべて','ソックス','レギンス/スパッツ','レッグウォーマー','その他'], 
  ['すべて','トランクス','ボクサーパンツ','その他'], 
  ['すべて']
]

parent = Category.create(name: 'メンズ')

mens_child_array.each.each_with_index do |child, i|
  child = parent.children.create(name: child)
  mens_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end




# ベビー・キッズ
baby_kids = Category.create(name: "ベビー・キッズ")
baby_kids_1 = baby_kids.children.create(name: "ベビー服(女の子用) ~95cm")
baby_kids_1.children.create([{name: "トップス"},{name: "アウター"},{name: "パンツ"},{name: "スカート"},{name: "ワンピース"},{name: "ベビードレス"},{name: "おくるみ"},{name: "下着/肌着"},{name: "パジャマ"},{name: "ロンパース"},{name: "その他"}])
baby_kids_2 = baby_kids.children.create(name: "ベビー服(男の子用) ~95cm")
baby_kids_2.children.create([{name: "トップス"},{name: "アウター"},{name: "パンツ"},{name: "おくるみ"},{name: "下着/肌着"},{name: "パジャマ"},{name: "ロンパース"},{name: "その他"}])
baby_kids_3 = baby_kids.children.create(name: "ベビー服(男女兼用) ~95cm")
baby_kids_3.children.create([{name: "トップス"},{name: "アウター"},{name: "パンツ"},{name: "おくるみ"},{name: "下着/肌着"},{name: "パジャマ"},{name: "ロンパース"},{name: "その他"}])
baby_kids_4 = baby_kids.children.create(name: "キッズ服(女の子用) 100cm~")
baby_kids_4.children.create([{name: "コート"},{name: "ジャケット/上着"},{name: "トップス(Tシャツ/カットソー)"},{name: "トップス(トレーナー)"},{name: "トップス(チュニック)"},{name: "トップス(タンクトップ)"},{name: "トップス(その他)"},{name: "スカート"},{name: "パンツ"},{name: "ワンピース"},{name: "セットアップ"},{name: "パジャマ"},{name: "フォーマル/ドレス"},{name: "和服"},{name: "浴衣"},{name: "甚平"},{name: "水着"},{name: "その他"}])
baby_kids_5 = baby_kids.children.create(name: "キッズ服(男の子用) 100cm~")
baby_kids_5.children.create([{name: "コート"},{name: "ジャケット/上着"},{name: "トップス(Tシャツ/カットソー)"},{name: "トップス(トレーナー)"},{name: "トップス(その他)"},{name: "パンツ"},{name: "セットアップ"},{name: "パジャマ"},{name: "フォーマル/ドレス"},{name: "和服"},{name: "浴衣"},{name: "甚平"},{name: "水着"},{name: "その他"}])
baby_kids_6 = baby_kids.children.create(name: "キッズ服(男女兼用) 100cm~")
baby_kids_6.children.create([{name: "コート"},{name: "ジャケット/上着"},{name: "トップス(Tシャツ/カットソー)"},{name: "トップス(トレーナー)"},{name: "トップス(その他)"},{name: "ボトムス"},{name: "パジャマ"},{name: "その他"}])
baby_kids_7 = baby_kids.children.create(name: "キッズ靴")
baby_kids_7.children.create([{name: "スニーカー"},{name: "サンダル"},{name: "ブーツ"},{name: "長靴"},{name: "その他"}])
baby_kids_8 = baby_kids.children.create(name: "子ども用ファッション小物")
baby_kids_8.children.create([{name: "靴下/スパッツ"},{name: "帽子"},{name: "エプロン"},{name: "サスペンダー"},{name: "タイツ"},{name: "ハンカチ"},{name: "バンダナ"},{name: "ベルト"},{name: "マフラー"},{name: "傘"},{name: "手袋"},{name: "スタイ"},{name: "バッグ"},{name: "その他"}])
baby_kids_9 = baby_kids.children.create(name: "おむつ/トイレ/バス")
baby_kids_9.children.create([{name: "おむつ用品"},{name: "おまる/補助便座"},{name: "トレーニングパンツ"},{name: "ベビーバス"},{name: "お風呂用品"},{name: "その他"}])
baby_kids_10 = baby_kids.children.create(name: "外出/移動用品")
baby_kids_10.children.create([{name: "ベビーカー"},{name: "抱っこひも/スリング"},{name: "チャイルドシート"},{name: "その他"}])
baby_kids_11 = baby_kids.children.create(name: "授乳/食事")
baby_kids_11.children.create([{name: "ミルク"},{name: "ベビーフード"},{name: "ベビー用食器"},{name: "その他"}])
baby_kids_12 = baby_kids.children.create(name: "ベビー家具/寝具/室内用品")
baby_kids_12.children.create([{name: "ベッド"},{name: "布団/毛布"},{name: "イス"},{name: "たんす"},{name: "その他"}])
baby_kids_13 = baby_kids.children.create(name: "おもちゃ")
baby_kids_13.children.create([{name: "おふろのおもちゃ"},{name: "がらがら"},{name: "オルゴール"},{name: "ベビージム"},{name: "手押し車/カタカタ"},{name: "知育玩具"},{name: "その他"}])
baby_kids_14 = baby_kids.children.create(name: "行事/記念品")
baby_kids_14.children.create([{name: "お宮参り用品"},{name: "お食い初め用品"},{name: "アルバム"},{name: "手形/足形"},{name: "その他"}])
baby_kids_15 = baby_kids.children.create(name: "その他")
baby_kids_15.children.create([{name: "母子手帳用品"},{name: "その他"}])


# インテリア・住まい・小物
interior_residence_accessory = Category.create(name: "インテリア・住まい・小物")
interior_residence_accessory_1 = interior_residence_accessory.children.create(name: "キッチン/食器")
interior_residence_accessory_1.children.create([{name: "食器"},{name: "調理器具"},{name: "収納/キッチン雑貨"},{name: "弁当用品"},{name: "カトラリー(スプーン等)"},{name: "テーブル用品"},{name: "容器"},{name: "エプロン"},{name: "アルコールグッズ"},{name: "浄水機"},{name: "その他"}])
interior_residence_accessory_2 = interior_residence_accessory.children.create(name: "ベッド/マットレス")
interior_residence_accessory_2.children.create([{name: "セミシングルベッド"},{name: "シングルベッド"},{name: "セミダブルベッド"},{name: "ダブルベッド"},{name: "ワイドダブルベッド"},{name: "クイーンベッド"},{name: "キングベッド"},{name: "脚付きマットレスベッド"},{name: "マットレス"},{name: "すのこベッド"},{name: "ロフトベッド/システムベッド"},{name: "簡易ベッド/折りたたみベッド"},{name: "収納付き"},{name: "その他"}])
interior_residence_accessory_3 = interior_residence_accessory.children.create(name: "ソファ/ソファベッド")
interior_residence_accessory_3.children.create([{name: "ソファセット"},{name: "シングルソファ"},{name: "ラブソファ"},{name: "トリプルソファ"},{name: "オットマン"},{name: "コーナーソファ"},{name: "ビーズソファ/クッションソファ"},{name: "ローソファ/フロアソファ"},{name: "ソファベッド"},{name: "応接セット"},{name: "ソファカバー"},{name: "リクライニングソファ"},{name: "その他"}])
interior_residence_accessory_4 = interior_residence_accessory.children.create(name: "椅子/チェア")
interior_residence_accessory_4.children.create([{name: "一般"},{name: "スツール"},{name: "ダイニングチェア"},{name: "ハイバックチェア"},{name: "ロッキングチェア"},{name: "座椅子"},{name: "折り畳みイス"},{name: "デスクチェア"},{name: "その他"}])
interior_residence_accessory_5 = interior_residence_accessory.children.create(name: "机/テーブル")
interior_residence_accessory_5.children.create([{name: "こたつ"},{name: "カウンターテーブル"},{name: "サイドテーブル"},{name: "センターテーブル"},{name: "ダイニングテーブル"},{name: "座卓/ちゃぶ台"},{name: "アウトドア用"},{name: "パソコン用"},{name: "事務机/学習机"},{name: "その他"}])
interior_residence_accessory_6 = interior_residence_accessory.children.create(name: "収納家具")
interior_residence_accessory_6.children.create([{name: "リビング収納"},{name: "キッチン収納"},{name: "玄関/屋外収納"},{name: "バス/トイレ収納"},{name: "本収納"},{name: "本/CD/DVD収納"},{name: "洋服タンス/押入れ収納"},{name: "電話台/ファックス台"},{name: "ドレッサー/鏡台"},{name: "棚/ラック"},{name: "ケース/ボックス"},{name: "その他"}])
interior_residence_accessory_7 = interior_residence_accessory.children.create(name: "ラグ/カーペット/マット")
interior_residence_accessory_7.children.create([{name: "ラグ"},{name: "カーペット"},{name: "ホットカーペット"},{name: "玄関/キッチンマット"},{name: "トイレ/バスマット"},{name: "その他"}])
interior_residence_accessory_8 = interior_residence_accessory.children.create(name: "カーテン/ブラインド")
interior_residence_accessory_8.children.create([{name: "カーテン"},{name: "ブラインド"},{name: "ロールスクリーン"},{name: "のれん"},{name: "その他"}])
interior_residence_accessory_9 = interior_residence_accessory.children.create(name: "ライト/照明")
interior_residence_accessory_9.children.create([{name: "蛍光灯/電球"},{name: "天井照明"},{name: "フロアスタンド"},{name: "その他"}])
interior_residence_accessory_10 = interior_residence_accessory.children.create(name: "寝具")
interior_residence_accessory_10.children.create([{name: "布団/毛布"},{name: "枕"},{name: "シーツ/カバー"},{name: "その他"}])
interior_residence_accessory_11 = interior_residence_accessory.children.create(name: "インテリア小物")
interior_residence_accessory_11.children.create([{name: "ごみ箱"},{name: "ウェルカムボード"},{name: "オルゴール"},{name: "クッション"},{name: "クッションカバー"},{name: "スリッパラック"},{name: "ティッシュボックス"},{name: "バスケット/かご"},{name: "フォトフレーム"},{name: "マガジンラック"},{name: "モビール"},{name: "モビール"},{name: "花瓶"},{name: "灰皿"},{name: "傘立て"},{name: "小物入れ"},{name: "置時計"},{name: "掛時計/柱時計"},{name: "鏡(立て掛け式)"},{name: "鏡(壁掛け式)"},{name: "置物"},{name: "風鈴"},{name: "植物/観葉植物"},{name: "その他"}])
interior_residence_accessory_12 = interior_residence_accessory.children.create(name: "季節/年中行事")
interior_residence_accessory_12.children.create([{name: "正月"},{name: "成人式"},{name: "バレンタインデー"},{name: "ひな祭り"},{name: "子どもの日"},{name: "母の日"},{name: "父の日"},{name: "父の日"},{name: "サマーギフト/お中元"},{name: "夏/夏休み"},{name: "ハロウィン"},{name: "敬老の日"},{name: "七五三"},{name: "お歳暮"},{name: "クリスマス"},{name: "冬一般"},{name: "その他"}])
interior_residence_accessory_13 = interior_residence_accessory.children.create(name: "その他")
interior_residence_accessory_13.children.create([{name: "すべて"}])
# 本・音楽・ゲーム
book_music_game = Category.create(name: "本・音楽・ゲーム")
book_music_game_1 = book_music_game.children.create(name: "本")
book_music_game_1.children.create([{name: "文学/小説"},{name: "人文/社会"},{name: "ノンフィクション/教養"},{name: "地図/旅行ガイド"},{name: "ビジネス/経済"},{name: "ビジネス/経済"},{name: "健康/医学"},{name: "コンピュータ/IT"},{name: "趣味/スポーツ/実用"},{name: "住まい/暮らし/子育て"},{name: "アート/エンタメ"},{name: "洋書"},{name: "絵本"},{name: "参考書"},{name: "その他"}])
book_music_game_2 = book_music_game.children.create(name: "漫画")
book_music_game_2.children.create([{name: "全巻セット"},{name: "少年漫画"},{name: "少女漫画"},{name: "青年漫画"},{name: "女性漫画"},{name: "同人誌"},{name: "その他"}])
book_music_game_3 = book_music_game.children.create(name: "雑誌")
book_music_game_3.children.create([{name: "アート/エンタメ/ホビー"},{name: "ファッション"},{name: "ニュース/総合"},{name: "趣味/スポーツ"},{name: "その他"}])
book_music_game_4 = book_music_game.children.create(name: "CD")
book_music_game_4.children.create([{name: "邦楽"},{name: "洋楽"},{name: "アニメ"},{name: "クラシック"},{name: "K-POP/アジア"},{name: "キッズ/ファミリー"},{name: "その他"}])
book_music_game_5 = book_music_game.children.create(name: "DVD/ブルーレイ")
book_music_game_5.children.create([{name: "外国映画"},{name: "日本映画"},{name: "アニメ"},{name: "TVドラマ"},{name: "ミュージック"},{name: "お笑い/バラエティ"},{name: "スポーツ/フィットネス"},{name: "キッズ/ファミリー"},{name: "その他"}])
book_music_game_6 = book_music_game.children.create(name: "レコード")
book_music_game_6.children.create([{name: "邦楽"},{name: "洋楽"},{name: "その他"}])
book_music_game_7 = book_music_game.children.create(name: "テレビゲーム")
book_music_game_7.children.create([{name: "家庭用ゲーム本体"},{name: "家庭用ゲームソフト"},{name: "携帯用ゲーム本体"},{name: "携帯用ゲームソフト"},{name: "PCゲーム"},{name: "その他"}])
# おもちゃ・ホビー・グッズ
toy_hobby_goods = Category.create(name: "おもちゃ・ホビー・グッズ")
toy_hobby_goods_1 = toy_hobby_goods.children.create(name: "おもちゃ")
toy_hobby_goods_1.children.create([{name: "キャラクターグッズ"},{name: "ぬいぐるみ"},{name: "小物/アクセサリー"},{name: "模型/プラモデル"},{name: "ミニカー"},{name: "トイラジコン"},{name: "プラモデル"},{name: "ホビーラジコン"},{name: "鉄道模型"},{name: "その他"}])
toy_hobby_goods_2 = toy_hobby_goods.children.create(name: "タレントグッズ")
toy_hobby_goods_2.children.create([{name: "アイドル"},{name: "ミュージシャン"},{name: "タレント/お笑い芸人"},{name: "スポーツ選手"},{name: "その他"}])
toy_hobby_goods_3 = toy_hobby_goods.children.create(name: "コミック/アニメグッズ")
toy_hobby_goods_3.children.create([{name: "ストラップ"},{name: "キーホルダー"},{name: "バッジ"},{name: "カード"},{name: "クリアファイル"},{name: "ポスター"},{name: "タオル"},{name: "その他"}])
toy_hobby_goods_4 = toy_hobby_goods.children.create(name: "トレーディングカード")
toy_hobby_goods_4.children.create([{name: "遊戯王"},{name: "マジック：ザ・ギャザリング"},{name: "ポケモンカードゲーム"},{name: "デュエルマスターズ"},{name: "バトルスピリッツ"},{name: "プリパラ"},{name: "アイカツ"},{name: "カードファイト!! ヴァンガード"},{name: "ヴァイスシュヴァルツ"},{name: "プロ野球オーナーズリーグ"},{name: "ベースボールヒーローズ"},{name: "ドラゴンボール"},{name: "スリーブ"},{name: "その他"}])
toy_hobby_goods_5 = toy_hobby_goods.children.create(name: "フィギュア")
toy_hobby_goods_5.children.create([{name: "コミック/アニメ"},{name: "特撮"},{name: "ゲームキャラクター"},{name: "SF/ファンタジー/ホラー"},{name: "アメコミ"},{name: "スポーツ"},{name: "ミリタリー"},{name: "その他"}])
toy_hobby_goods_6 = toy_hobby_goods.children.create(name: "楽器/器材")
toy_hobby_goods_6.children.create([{name: "エレキギター"},{name: "アコースティックギター"},{name: "ベース"},{name: "エフェクター"},{name: "アンプ"},{name: "弦楽器"},{name: "管楽器"},{name: "鍵盤楽器"},{name: "打楽器"},{name: "和楽器"},{name: "楽譜/スコア"},{name: "レコーディング/PA機器"},{name: "DJ機器"},{name: "DTM/DAW"},{name: "その他"}])
toy_hobby_goods_7 = toy_hobby_goods.children.create(name: "コレクション")
toy_hobby_goods_7.children.create([{name: "武具"},{name: "使用済切手/官製はがき"},{name: "旧貨幣/金貨/銀貨/記念硬貨"},{name: "印刷物"},{name: "ノベルティグッズ"},{name: "その他"}])
toy_hobby_goods_8 = toy_hobby_goods.children.create(name: "ミリタリー")
toy_hobby_goods_8.children.create([{name: "トイガン"},{name: "個人装備"},{name: "その他"}])
toy_hobby_goods_9 = toy_hobby_goods.children.create(name: "美術品")
toy_hobby_goods_9.children.create([{name: "陶芸"},{name: "ガラス"},{name: "漆芸"},{name: "金属工芸"},{name: "絵画/タペストリ"},{name: "版画"},{name: "彫刻/オブジェクト"},{name: "書"},{name: "写真"},{name: "その他"}])
toy_hobby_goods_10 = toy_hobby_goods.children.create(name: "アート用品")
toy_hobby_goods_10.children.create([{name: "画材"},{name: "額縁"},{name: "その他"}])
toy_hobby_goods_11 = toy_hobby_goods.children.create(name: "その他")
toy_hobby_goods_11.children.create([{name: "トランプ/UNO"},{name: "カルタ/百人一首"},{name: "ダーツ"},{name: "ビリヤード"},{name: "麻雀"},{name: "パズル/ジグソーパズル"},{name: "囲碁/将棋"},{name: "オセロ/チェス"},{name: "人生ゲーム"},{name: "野球/サッカーゲーム"},{name: "スポーツ"},{name: "三輪車/乗り物"},{name: "ヨーヨー"},{name: "模型製作用品"},{name: "鉄道"},{name: "航空機"},{name: "アマチュア無線"},{name: "パチンコ/パチスロ"},{name: "その他"}])
# コスメ・香水・美容
cosme_perfume_beauty = Category.create(name: "コスメ・香水・美容")
cosme_perfume_beauty_1 = cosme_perfume_beauty.children.create(name: "ベースメイク")
cosme_perfume_beauty_1.children.create([{name: "ファンデーション"},{name: "化粧下地"},{name: "コントロールカラー"},{name: "BBクリーム"},{name: "CCクリーム"},{name: "コンシーラー"},{name: "フェイスパウダー"},{name: "トライアルセット/サンプル"},{name: "その他"}])
cosme_perfume_beauty_2 = cosme_perfume_beauty.children.create(name: "メイクアップ")
cosme_perfume_beauty_2.children.create([{name: "アイシャドウ"},{name: "口紅"},{name: "リップグロス"},{name: "リップライナー"},{name: "チーク"},{name: "フェイスカラー"},{name: "マスカラ"},{name: "アイライナー"},{name: "つけまつげ"},{name: "アイブロウペンシル"},{name: "パウダーアイブロウ"},{name: "眉マスカラ"},{name: "トライアルセット/サンプル"},{name: "メイク道具/化粧小物"},{name: "美顔用品/美顔ローラー"},{name: "その他"}])
cosme_perfume_beauty_3 = cosme_perfume_beauty.children.create(name: "ネイルケア")
cosme_perfume_beauty_3.children.create([{name: "ネイルカラー"},{name: "カラージェル"},{name: "ネイルベースコート/トップコート"},{name: "ネイルアート用品"},{name: "ネイルパーツ"},{name: "ネイルチップ/付け爪"},{name: "手入れ用具"},{name: "除光液"},{name: "その他"}])
cosme_perfume_beauty_4 = cosme_perfume_beauty.children.create(name: "香水")
cosme_perfume_beauty_4.children.create([{name: "香水(女性用)"},{name: "香水(男性用)"},{name: "ユニセックス"},{name: "ボディミスト"},{name: "その他"}])
cosme_perfume_beauty_5 = cosme_perfume_beauty.children.create(name: "スキンケア/基礎化粧品")
cosme_perfume_beauty_5.children.create([{name: "化粧水/ローション"},{name: "乳液/ミルク"},{name: "美容液"},{name: "フェイスクリーム"},{name: "洗顔料"},{name: "クレンジング/メイク落とし"},{name: "パック/フェイスマスク"},{name: "ジェル/ゲル"},{name: "ブースター/導入液"},{name: "アイケア"},{name: "リップケア"},{name: "トライアルセット/サンプル"},{name: "洗顔グッズ"},{name: "その他"}])
cosme_perfume_beauty_6 = cosme_perfume_beauty.children.create(name: "ヘアケア")
cosme_perfume_beauty_6.children.create([{name: "シャンプー"},{name: "トリートメント"},{name: "コンディショナー"},{name: "リンス"},{name: "スタイリング剤"},{name: "カラーリング剤"},{name: "ブラシ"},{name: "その他"}])
cosme_perfume_beauty_7 = cosme_perfume_beauty.children.create(name: "ボディケア")
cosme_perfume_beauty_7.children.create([{name: "オイル/クリーム"},{name: "ハンドクリーム"},{name: "ローション"},{name: "日焼け止め/サンオイル"},{name: "ボディソープ"},{name: "入浴剤"},{name: "制汗/デオドラント"},{name: "フットケア"},{name: "その他"}])
cosme_perfume_beauty_8 = cosme_perfume_beauty.children.create(name: "オーラルケア")
cosme_perfume_beauty_8.children.create([{name: "口臭防止/エチケット用品"},{name: "歯ブラシ"},{name: "その他"}])
cosme_perfume_beauty_9 = cosme_perfume_beauty.children.create(name: "リラクゼーション")
cosme_perfume_beauty_9.children.create([{name: "エッセンシャルオイル"},{name: "芳香器"},{name: "お香/香炉"},{name: "キャンドル"},{name: "リラクゼーショングッズ"},{name: "その他"}])
cosme_perfume_beauty_10 = cosme_perfume_beauty.children.create(name: "ダイエット")
cosme_perfume_beauty_10.children.create([{name: "ダイエット食品"},{name: "エクササイズ用品"},{name: "体重計"},{name: "体脂肪計"},{name: "その他"}])
cosme_perfume_beauty_11 = cosme_perfume_beauty.children.create(name: "その他")
cosme_perfume_beauty_11.children.create([{name: "健康用品"},{name: "看護/介護用品"},{name: "救急/衛生用品"},{name: "その他"}])

# 家電・スマホ・カメラ
appliance_smartphone_camera = Category.create(name: "家電・スマホ・カメラ")
appliance_smartphone_camera_1 = appliance_smartphone_camera.children.create(name: "スマートフォン/携帯電話")
appliance_smartphone_camera_1.children.create([{name: "スマートフォン本体"},{name: "バッテリー/充電器"},{name: "携帯電話本体"},{name: "PHS本体"},{name: "その他"}])
appliance_smartphone_camera_2 = appliance_smartphone_camera.children.create(name: "スマホアクセサリー")
appliance_smartphone_camera_2.children.create([{name: "Android用ケース"},{name: "iPhone用ケース"},{name: "カバー"},{name: "イヤホンジャック"},{name: "ストラップ"},{name: "フィルム"},{name: "自撮り棒"},{name: "その他"}])
appliance_smartphone_camera_3 = appliance_smartphone_camera.children.create(name: "PC/タブレット")
appliance_smartphone_camera_3.children.create([{name: "タブレット"},{name: "ノートPC"},{name: "デスクトップ型PC"},{name: "ディスプレイ"},{name: "電子ブックリーダー"},{name: "PC周辺機器"},{name: "PCパーツ"},{name: "その他"}])
appliance_smartphone_camera_4 = appliance_smartphone_camera.children.create(name: "カメラ")
appliance_smartphone_camera_4.children.create([{name: "デジタルカメラ"},{name: "ビデオカメラ"},{name: "レンズ(単焦点)"},{name: "レンズ(ズーム)"},{name: "フィルムカメラ"},{name: "防犯カメラ"},{name: "その他"}])
appliance_smartphone_camera_5 = appliance_smartphone_camera.children.create(name: "テレビ/映像機器")
appliance_smartphone_camera_5.children.create([{name: "テレビ"},{name: "プロジェクター"},{name: "ブルーレイレコーダー"},{name: "DVDレコーダー"},{name: "ブルーレイプレーヤー"},{name: "DVDプレーヤー"},{name: "映像用ケーブル"},{name: "その他"}])
appliance_smartphone_camera_6 = appliance_smartphone_camera.children.create(name: "オーディオ機器")
appliance_smartphone_camera_6.children.create([{name: "ポータブルプレーヤー"},{name: "イヤフォン"},{name: "ヘッドフォン"},{name: "アンプ"},{name: "スピーカー"},{name: "ケーブル/シールド"},{name: "ラジオ"},{name: "その他"}])
appliance_smartphone_camera_7 = appliance_smartphone_camera.children.create(name: "美容/健康")
appliance_smartphone_camera_7.children.create([{name: "ヘアドライヤー"},{name: "ヘアアイロン"},{name: "美容機器"},{name: "電気シェーバー"},{name: "電動歯ブラシ"},{name: "その他"}])
appliance_smartphone_camera_8 = appliance_smartphone_camera.children.create(name: "冷暖房/空調")
appliance_smartphone_camera_8.children.create([{name: "エアコン"},{name: "空気清浄器"},{name: "加湿器"},{name: "扇風機"},{name: "除湿機"},{name: "ファンヒーター"},{name: "電気ヒーター"},{name: "オイルヒーター"},{name: "ストーブ"},{name: "ホットカーペット"},{name: "こたつ"},{name: "電気毛布"},{name: "その他"}])
appliance_smartphone_camera_9 = appliance_smartphone_camera.children.create(name: "生活家電")
appliance_smartphone_camera_9.children.create([{name: "冷蔵庫"},{name: "洗濯機"},{name: "炊飯器"},{name: "電子レンジ/オーブン"},{name: "調理機器"},{name: "アイロン"},{name: "掃除機"},{name: "エスプレッソマシン"},{name: "コーヒーメーカー"},{name: "衣類乾燥機"},{name: "その他"}])
appliance_smartphone_camera_10 = appliance_smartphone_camera.children.create(name: "その他")
appliance_smartphone_camera_10.children.create([{name: "その他"}])
# スポーツ・レジャー
sport_leisure = Category.create(name: "スポーツ・レジャー")
sport_leisure_1 = sport_leisure.children.create(name: "ゴルフ")
sport_leisure_1.children.create([{name: "クラブ"},{name: "ウエア(男性用)"},{name: "ウエア(女性用)"},{name: "バッグ"},{name: "シューズ(男性用)"},{name: "シューズ(女性用)"},{name: "アクセサリー"},{name: "その他"}])
sport_leisure_2 = sport_leisure.children.create(name: "フィッシング")
sport_leisure_2.children.create([{name: "ロッド"},{name: "リール"},{name: "ルアー用品"},{name: "ウエア"},{name: "釣り糸/ライン"},{name: "その他"}])
sport_leisure_3 = sport_leisure.children.create(name: "自転車")
sport_leisure_3.children.create([{name: "自転車本体"},{name: "ウエア"},{name: "パーツ"},{name: "アクセサリー"},{name: "バッグ"},{name: "工具/メンテナンス"},{name: "その他"}])
sport_leisure_4 = sport_leisure.children.create(name: "トレーニング/エクササイズ")
sport_leisure_4.children.create([{name: "ランニング"},{name: "ウォーキング"},{name: "ヨガ"},{name: "トレーニング用品"},{name: "その他"}])
sport_leisure_5 = sport_leisure.children.create(name: "野球")
sport_leisure_5.children.create([{name: "ウェア"},{name: "シューズ"},{name: "グローブ"},{name: "バット"},{name: "アクセサリー"},{name: "防具"},{name: "練習機器"},{name: "記念グッズ"},{name: "応援グッズ"},{name: "その他"}])
sport_leisure_6 = sport_leisure.children.create(name: "サッカー/フットサル")
sport_leisure_6.children.create([{name: "ウェア"},{name: "シューズ"},{name: "ボール"},{name: "アクセサリー"},{name: "記念グッズ"},{name: "応援グッズ"},{name: "その他"}])
sport_leisure_7 = sport_leisure.children.create(name: "テニス")
sport_leisure_7.children.create([{name: "ラケット(硬式用)"},{name: "ラケット(軟式用)"},{name: "ウェア"},{name: "シューズ"},{name: "ボール"},{name: "アクセサリー"},{name: "記念グッズ"},{name: "応援グッズ"},{name: "その他"}])
sport_leisure_8 = sport_leisure.children.create(name: "スノーボード")
sport_leisure_8.children.create([{name: "ボード"},{name: "バインディング"},{name: "ブーツ(男性用)"},{name: "ブーツ(女性用)"},{name: "ブーツ(子ども用)"},{name: "ウエア/装備(男性用)"},{name: "ウエア/装備(女性用)"},{name: "ウエア/装備(子ども用)"},{name: "アクセサリー"},{name: "バッグ"},{name: "その他"}])
sport_leisure_9 = sport_leisure.children.create(name: "スキー")
sport_leisure_9.children.create([{name: "板"},{name: "ブーツ(男性用)"},{name: "ブーツ(女性用)"},{name: "ブーツ(子ども用)"},{name: "ビンディング"},{name: "ウエア(男性用)"},{name: "ウエア(女性用)"},{name: "ウエア(子ども用)"},{name: "ストック"},{name: "その他"}])
sport_leisure_10 = sport_leisure.children.create(name: "その他スポーツ")
sport_leisure_10.children.create([{name: "ダンス/バレエ"},{name: "サーフィン"},{name: "バスケットボール"},{name: "バドミントン"},{name: "バレーボール"},{name: "スケートボード"},{name: "陸上競技"},{name: "ラグビー"},{name: "アメリカンフットボール"},{name: "ボクシング"},{name: "ボウリング"},{name: "その他"}])
sport_leisure_11 = sport_leisure.children.create(name: "アウトドア")
sport_leisure_11.children.create([{name: "テント/タープ"},{name: "ライト/ランタン"},{name: "寝袋/寝具"},{name: "テーブル/チェア"},{name: "ストーブ/コンロ"},{name: "調理器具"},{name: "食器"},{name: "登山用品"},{name: "その他"}])
sport_leisure_12 = sport_leisure.children.create(name: "その他")
sport_leisure_12.children.create([{name: "旅行用品"},{name: "その他"}])
# ハンドメイド
handmade = Category.create(name: "ハンドメイド")
handmade_1 = handmade.children.create(name: "アクセサリー(女性用)")
handmade_1.children.create([{name: "ピアス"},{name: "イヤリング"},{name: "ネックレス"},{name: "ブレスレット"},{name: "リング"},{name: "チャーム"},{name: "ヘアゴム"},{name: "アンクレット"},{name: "その他"}])
handmade_2 = handmade.children.create(name: "ファッション/小物")
handmade_2.children.create([{name: "バッグ(女性用)"},{name: "バッグ(男性用)"},{name: "財布(女性用)"},{name: "財布(男性用)"},{name: "ファッション雑貨"},{name: "その他"}])
handmade_3 = handmade.children.create(name: "アクセサリー/時計")
handmade_3.children.create([{name: "アクセサリー(男性用)"},{name: "時計(女性用)"},{name: "時計(男性用)"},{name: "その他"}])
handmade_4 = handmade.children.create(name: "日用品/インテリア")
handmade_4.children.create([{name: "キッチン用品"},{name: "家具"},{name: "文房具"},{name: "アート/写真"},{name: "アロマ/キャンドル"},{name: "フラワー/ガーデン"},{name: "その他"}])
handmade_5 = handmade.children.create(name: "趣味/おもちゃ")
handmade_5.children.create([{name: "クラフト/布製品"},{name: "おもちゃ/人形"},{name: "その他"}])
handmade_6 = handmade.children.create(name: "キッズ/ベビー")
handmade_6.children.create([{name: "ファッション雑貨"},{name: "スタイ/よだれかけ"},{name: "外出用品"},{name: "ネームタグ"},{name: "その他"}])
handmade_7 = handmade.children.create(name: "素材/材料")
handmade_7.children.create([{name: "各種パーツ"},{name: "生地/糸"},{name: "型紙/パターン"},{name: "その他"}])
handmade_8 = handmade.children.create(name: "二次創作物")
handmade_8.children.create([{name: "Ingress"},{name: "クリエイターズ宇宙兄弟"},{name: "その他"},{name: "チケット"},{name: "すべて"}])
handmade_9 = handmade.children.create(name: "その他")
handmade_9.children.create([{name: "すべて"}])
# チケット
ticket = Category.create(name: "チケット")
ticket_1 = ticket.children.create(name: "音楽")
ticket_1.children.create([{name: "男性アイドル"},{name: "女性アイドル"},{name: "韓流"},{name: "国内アーティスト"},{name: "海外アーティスト"},{name: "音楽フェス"},{name: "声優/アニメ"},{name: "その他"}])
ticket_2 = ticket.children.create(name: "スポーツ")
ticket_2.children.create([{name: "サッカー"},{name: "野球"},{name: "テニス"},{name: "格闘技/プロレス"},{name: "相撲/武道"},{name: "ゴルフ"},{name: "バレーボール"},{name: "バスケットボール"},{name: "モータースポーツ"},{name: "ウィンタースポーツ"},{name: "その他"}])
ticket_3 = ticket.children.create(name: "演劇/芸能")
ticket_3.children.create([{name: "ミュージカル"},{name: "演劇"},{name: "伝統芸能"},{name: "落語"},{name: "お笑い"},{name: "オペラ"},{name: "サーカス"},{name: "バレエ"},{name: "その他"}])
ticket_4 = ticket.children.create(name: "イベント")
ticket_4.children.create([{name: "声優/アニメ"},{name: "キッズ/ファミリー"},{name: "トークショー/講演会"},{name: "その他"}])
ticket_5 = ticket.children.create(name: "映画")
ticket_5.children.create([{name: "邦画"},{name: "洋画"},{name: "その他"}])
ticket_6 = ticket.children.create(name: "施設利用券")
ticket_6.children.create([{name: "遊園地/テーマパーク"},{name: "美術館/博物館"},{name: "スキー場"},{name: "ゴルフ場"},{name: "フィットネスクラブ"},{name: "プール"},{name: "ボウリング場"},{name: "水族館"},{name: "動物園"},{name: "その他"}])
ticket_7 = ticket.children.create(name: "優待券/割引券")
ticket_7.children.create([{name: "ショッピング"},{name: "レストラン/食事券"},{name: "フード/ドリンク券"},{name: "宿泊券"},{name: "その他"}])
ticket_8 = ticket.children.create(name: "その他")
ticket_8.children.create([{name: "すべて"}])
# 自動車・オートバイ
car_motorcycle = Category.create(name: "自動車・オートバイ")
car_motorcycle_1 = car_motorcycle.children.create(name: "自動車本体")
car_motorcycle_1.children.create([{name: "国内自動車本体"},{name: "外国自動車本体"}])
car_motorcycle_2 = car_motorcycle.children.create(name: "自動車タイヤ/ホイール")
car_motorcycle_2.children.create([{name: "タイヤ/ホイールセット"},{name: "タイヤ"},{name: "ホイール"},{name: "その他"}])
car_motorcycle_3 = car_motorcycle.children.create(name: "自動車パーツ")
car_motorcycle_3.children.create([{name: "サスペンション"},{name: "ブレーキ"},{name: "外装、エアロパーツ"},{name: "ライト"},{name: "内装品、シート"},{name: "ステアリング"},{name: "マフラー・排気系"},{name: "エンジン、過給器、冷却装置"},{name: "クラッチ、ミッション、駆動系"},{name: "電装品"},{name: "補強パーツ"},{name: "汎用パーツ"},{name: "外国自動車用パーツ"},{name: "その他"}])
car_motorcycle_4 = car_motorcycle.children.create(name: "自動車アクセサリー")
car_motorcycle_4.children.create([{name: "車内アクセサリー"},{name: "カーナビ"},{name: "カーオーディオ"},{name: "車外アクセサリー"},{name: "メンテナンス用品"},{name: "チャイルドシート"},{name: "ドライブレコーダー"},{name: "レーダー探知機"},{name: "カタログ/マニュアル"},{name: "セキュリティ"},{name: "ETC"},{name: "その他"}])
car_motorcycle_5 = car_motorcycle.children.create(name: "オートバイ車体")
car_motorcycle_5.children.create([{name: "すべて"}])
car_motorcycle_6 = car_motorcycle.children.create(name: "オートバイパーツ")
car_motorcycle_6.children.create([{name: "タイヤ"},{name: "マフラー"},{name: "エンジン、冷却装置"},{name: "カウル、フェンダー、外装"},{name: "サスペンション"},{name: "ホイール"},{name: "シート"},{name: "ブレーキ"},{name: "タンク"},{name: "ライト、ウィンカー"},{name: "チェーン、スプロケット、駆動系"},{name: "メーター"},{name: "電装系"},{name: "ミラー"},{name: "外国オートバイ用パーツ"},{name: "その他"}])
car_motorcycle_7 = car_motorcycle.children.create(name: "オートバイアクセサリー")
car_motorcycle_7.children.create([{name: "ヘルメット/シールド"},{name: "バイクウエア/装備"},{name: "アクセサリー"},{name: "メンテナンス"},{name: "カタログ/マニュアル"},{name: "その他"}])

#その他ブロック

#その他の子カテゴリー配列
other_child_array = ['まとめ売り','ペット用品','食品','飲料/酒','日用品/生活雑貨/旅行','アンティーク/コレクション','文房具/事務用品','事務/店舗用品','その他']
#その他の孫カテゴリー配列
other_grandchild_array = 
[
  ['すべて'], 
  ['すべて','ペットフード','犬用品','猫用品','魚用品/水草','小動物用品','爬虫類/両生類用品','かご/おり','鳥用品','虫類用品','その他'], 
  ['すべて','菓子','米','野菜','果物','調味料','魚介類(加工食品)','肉類(加工食品)','その他 加工食品','その他'], 
  ['すべて','コーヒー','ソフトドリンク','ミネラルウォーター','茶','ウイスキー','ワイン','ブランデー','焼酎','日本酒','ビール、発泡酒','その他'], 
  ['すべて','タオル/バス用品','日用品/生活雑貨','洗剤/柔軟剤','旅行用品','防災関連グッズ','その他'], 
  ['すべて','雑貨','工芸品','家具','印刷物','その他'], 
  ['すべて','筆記具','ノート/メモ帳','テープ/マスキングテープ','カレンダー/スケジュール','アルバム/スクラップ','ファイル/バインダー','はさみ/カッター','カードホルダー/名刺管理','のり/ホッチキス','その他'], 
  ['すべて','オフィス用品一般','オフィス家具','店舗用品','OA機器','ラッピング/包装','その他'], 
  ['すべて']
]

parent = Category.create(name: 'その他')

other_child_array.each.each_with_index do |child, i|
  child = parent.children.create(name: child)
  other_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end














