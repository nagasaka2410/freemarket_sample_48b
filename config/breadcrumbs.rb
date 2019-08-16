crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", users_path
  parent :root
end

crumb :category do
  link "カテゴリー一覧", categories_path
  parent :root
end

crumb :profile do
  link "プロフィール", edit_user_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", user_logout_users_path
  parent :mypage
end

crumb :identification do
  link "本人情報の登録", identification_user_path(current_user)
  parent :mypage
end

crumb :search do
  link "#{params[:keyword]}", search_products_path
  parent :root
end

crumb :categories do |category|
  link "#{category.name}", category_path(category)
  parent :category
end