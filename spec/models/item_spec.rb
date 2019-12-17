require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "#create" do
    context 'can save' do
 
      it 'is valid with each attribute' do
        @user = FactoryBot.create(:user)
        @category = FactoryBot.create(:category)
        binding.pry
        item = build(:item, user: @user, category: @category)
        image = build(:image, item: item, src: "sample.jpg")
        expect(item).to be_valid
      end

      # it 'is valid without brand_id' do
      #   item = build(:item, user: user)
      #   expect(item).to be_valid
      # end
    end
  end
end