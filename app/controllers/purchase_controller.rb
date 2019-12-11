class PurchaseController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only:[:buy,:pay]
  before_action :my_card, only:[:buy,:pay]

  require 'payjp'

  def buy
    @user = @item.user
    @prefecture = Prefecture.find(@item.prefecture_id)
    @address= Address.find_by(user_id: current_user.id)
    if @card.blank?
       render layout: false
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
      render layout: false
    end
  end

  def buy_complete
    render layout: false
  end

  def pay
    if @card.blank?
      redirect_to controller: "card", action: "addition"
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else @card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      Payjp::Charge.create(
      amount: @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
      customer: @card.customer_id, #顧客ID
      currency: 'jpy', #日本円
      )
      if @item.update(status: 4, buyer_id: current_user.id)
        flash[:notice] = '購入しました'
        redirect_to action: "buy_complete" #完了画面に移動
      else
        flash[:alert] = '購入に失敗しました'
        redirect_to action: "buy_" #完了画面に移動
      end
    end
  end

  private 

  def set_item
    @item = Item.find(params[:id])
  end
  
  def my_card
    @card = Card.where(user_id: current_user.id).first
  end

end


