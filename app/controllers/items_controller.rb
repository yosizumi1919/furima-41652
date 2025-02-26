class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @Items = Item.all.order('created_at DESC')
  end

  def new
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
end
