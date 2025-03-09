class OrdersController < ApplicationController
  before_action :move_to_root_path, only: [:index]
  before_action :set_item, only: [:index]
  before_action :order_user, only: [:index]
  before_action :sold_out, only: [:index]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order = Order.new
    @item = Item.find(params[:item_id])
    @form = Form.new
  end

  def create
    @item = Item.find(params[:item_id])
    @form = Form.new(form_params)
    if @form.valid?
      pay_item

      @form.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def form_params
    params.require(:form).permit(:address_number, :region_id, :city, :street, :building, :phone_number,
                                 :order_id).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: form_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_root_path
    return if user_signed_in?

    redirect_to root_path
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_user
    return unless current_user.id == @item.user_id

    redirect_to root_path
  end

  def sold_out
    return unless current_user.id != @item.user_id && @item.order.present?

    redirect_to root_path
  end
end
