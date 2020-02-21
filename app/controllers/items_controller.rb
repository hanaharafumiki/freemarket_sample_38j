class ItemsController < ApplicationController
  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  def edit
  end

  def update
  end

  def destroy

  end

  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :status, :description, :charge, :area, :day, :sale, images_attributes: [:picture])
  end
end