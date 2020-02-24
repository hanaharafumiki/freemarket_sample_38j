class ItemsController < ApplicationController
  def index

  end

  def new
 
  end

  def show
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  def destory
    item = Item.find(params[:id])
    item.destory
  end

end