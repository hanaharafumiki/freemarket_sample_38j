class PurchasesController < ApplicationController

  require 'payjp'

  def edit
    @item = set_item
    card = set_card
    if card.blank?
      redirect_to controller: "cards", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    @item = Item.find_by(id: params[:item_id])
    card = set_card
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => @item.price,
    :customer => card.customer_id,
    :currency => 'jpy',
  )
  @item.update(sale: 1)
  redirect_to items_path(current_user.id)
  end

  private

  def set_item
    Item.find(params[:id])
  end

  def set_card
    Card.where(user_id: current_user.id).first
  end
end
