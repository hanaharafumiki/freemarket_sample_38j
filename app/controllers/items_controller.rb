class ItemsController < ApplicationController
  def index

  end

  def new
    @item = Item.new          
    @parents = Category.where(ancestry: nil)
    @item.build_brand
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '出品できました'
    else
      flash.now[:alert] = 'ちゃんと書いてください'
      render :new
    end
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

  def destroy
    item = Item.find(params[:id])
    item.destory
  end

  def search
    if params[:l_cat]
      @m_cat = Category.find(params[:l_cat]).children
    elsif params[:m_cat]
      @s_cat = Category.find(params[:m_cat]).children
    end

    respond_to do |format|
      format.html
      format.json 
    end
  end

  def item_params
    params.require(:item).permit(:name, :price, :status, :description, :charge, :area, :day, :category_id, brand_attributes: [:id, :name])
  end
  
end