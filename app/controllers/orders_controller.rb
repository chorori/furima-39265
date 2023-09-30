class OrdersController < ApplicationController

  def create
    @order_address_form = OrderAddressForm.new(order_address_form_params)
    if @order_address_form.valid?
      @order_address_form.save
      redirect_to root_path, notice: 'Order was successfully created.'
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  def index
    @item = Item.find(params[:item_id])
    @order_address_form = OrderAddressForm.new
  end
  
  private
  
  def order_address_form_params
    params.require(:order_address_form).permit(:postal_code, :shipping_region_id, :city, :street_address, :building_name, :phone_number, :token).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
