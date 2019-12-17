FactoryBot.define do
  
  factory :category do
    name              {"レディース"}
    factory :child do
      after(:build) do |category|
        category.children << build(:child, name: "バッグ" )
        factory :grandchild do
          after(:build) do |child|
            child.children << build(:grandchild, name: "ハンドバッグ" )
          end
        end
      end
    end

  end
end