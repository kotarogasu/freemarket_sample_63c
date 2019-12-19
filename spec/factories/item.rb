FactoryBot.define do
  
  factory :item do
    id                {10000}
    name              {"testbag"}
    item_text         {Faker::Lorem.sentence}
    condition         {1}
    delivery_fee      {1}
    delivery_method   {1}
    days              {1}
    price             {500}
    fee               {price * 0.1}
    profit            {price * 0.9}
    status            {1}
    prefecture_id     {1}
    brand_id          {1}
    category       
    user           
    after(:create) do |item|
      create_list(:image, 3, item: item)
    end
    
    
  end
  



end