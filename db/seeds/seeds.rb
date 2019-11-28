Pathname.glob(Rails.root.join('db/seeds/*.rb')) do |path|
  load(path)
end