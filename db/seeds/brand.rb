10.times do |i|
  Brand.create!(
    name: "hogebrand#{i + 1}"
  )
end

Brand.create!(name: "シャネル")
Brand.create!(name: "ルイヴィトン")
Brand.create!(name: "スプリーム")
Brand.create!(name: "ナイキ")