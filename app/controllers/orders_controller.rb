class OrdersController < ApplicationController

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
    @form = Form.new
    
  end

  def create
    @item = Item.find(params[:item_id])
    @form = Form.new(form_params)
    if  
      @form.save
      return redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def form_params
    params.require(:form).permit(:address_number,:region_id,:city,:street,:building,:phone_number,
    :order_id ).merge(user_id: current_user.id,item_id:@item.id)
  end


end
