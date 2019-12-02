10.times do |i|
  Brand.create!(
    name: "hogebrand#{i + 1}"
  )
end