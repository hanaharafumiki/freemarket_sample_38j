class ItemsController < ApplicationController
  def index
    @cates = Item.where(sale: 0).first(3)
    @piccs = Image.where(item_id: @cates).distinct
  end

  def new
 
  end

  def show

  end
end
