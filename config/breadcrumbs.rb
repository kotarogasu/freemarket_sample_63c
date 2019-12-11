crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", mypage_users_path
  parent :root
end

crumb :card do
  link "支払い方法", card_index_path
  parent :mypage
end

crumb :listing_users do
  link "出品した商品 - 出品中", listing_users_path
  parent :mypage
end

crumb :profile do
  link "プロフィール", profile_users_path
  parent :mypage
end

crumb :identification do
  link "本人情報の登録", identification_users_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_signup_index_path
  parent :mypage
end

crumb :shopping_users do
  link "購入した商品", shopping_users_path
  parent :mypage
end


crumb :item do |item|
  item = Item.find_by(id: params[:id])
  link item.name
  parent :root
end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).