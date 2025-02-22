class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @Item = Item.new

  end

  def create
    Item.create(item_params)
    
    redirect_to '/'
  end

  private
  def item_params
    params.require(:item).permit(:item_name,:explanation,:category_id,:status_id,:burden_id,:region_id,
    :day_id,:price,:user)
  end
  
end
