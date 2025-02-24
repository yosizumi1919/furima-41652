class ItemsController < ApplicationController
before_action :user_login, only:[:create]

  def index
   #  @items = Item.all
  end

  def new
    authenticate_user!

    @Item = Item.new
  end

  def create
    @Item = Item.new(item_params)
    if @Item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :status_id, :burden_id, :region_id,
   :day_id, :price, :image).merge(user_id: current_user.id)
  end
  
  def user_login
    authenticate_user!
  end

end
