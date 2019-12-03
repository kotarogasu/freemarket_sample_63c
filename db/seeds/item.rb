10.times do |i|
  Item.create!(
    name: "hoge#{i + 1}",
    item_text: "hoge#{i + 1}の説明です", 
    price: i * 10000,
    condition: 1; 
    delivery_fee: 1, 
    days: 1, 
    prefecture_id: 1,
    user_id: 1,
    category_id: 2;
    brand_id: 1;
  )
end

