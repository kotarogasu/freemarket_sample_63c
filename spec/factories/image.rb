FactoryBot.define do
  
  factory :image do
    # src {File.open("#{Rails.root}/public/images/test_image.jpeg")} 
    # src { Rack::Test::UploadedFile.new(Rails.root.join('public/images/test_image.jpeg'), 'image/jpeg') }
    src { Rack::Test::UploadedFile.new(File.open("#{Rails.root}/public/images/test_image.jpeg")) }
    # src {"sample.jpg"}
    # src {Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/images/test_image.jpeg'))}
    item
  end

end

