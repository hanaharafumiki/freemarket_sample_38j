class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
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
end