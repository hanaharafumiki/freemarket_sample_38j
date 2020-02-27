class CardsController < ApplicationController
  require "payjp"
  before_action :set_card, only: :new
  before_action :set_card_first, only: [:destroy, :show]

  def new
    redirect_to card_path(current_user.id) if @card.exists?
  end

  def pay
    Payjp.api_key = Rails.application.credentials.PAYJP[:secret_access_key]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト',
      email: current_user.email,
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to card_path(current_user.id)
      else
        redirect_to action: "pay"
      end
    end
  end

  def destroy
    unless @card.blank?
      Payjp.api_key = Rails.application.credentials.PAYJP[:secret_access_key]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
    end
      redirect_to user_path(current_user.id)
  end


  def show
    if @card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = Rails.application.credentials.PAYJP[:secret_access_key]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end
  
  private

  def set_card
    @card = Card.where(user_id: current_user.id)
  end
  
  def set_card_first
    @card = Card.where(user_id: current_user.id).first
  end
end
