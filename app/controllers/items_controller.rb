class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_new, only: [:edit, :destroy]

  def index
    @Items = Item.all.order('created_at DESC')
  end

  def new
    @Item = Item.new
  end

  def show
  end

  def create
    @Item = Item.new(item_params)
    if @Item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :status_id, :burden_id, :region_id,
                                 :day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_new
    return if current_user.id == @item.user_id

    redirect_to root_path
  end
end
