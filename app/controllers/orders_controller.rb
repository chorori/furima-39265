class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root_path, only: [:index, :create]

  def index
    @order_address_form = OrderAddressForm.new
  end

  def create
    @order_address_form = OrderAddressForm.new(order_address_form_params)
    if @order_address_form.valid?
      pay_item
      @order_address_form.save
      redirect_to root_path, notice: 'Order was successfully created.'
    else
      render :index
    end
  end
  
  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root_path
    redirect_to root_path if current_user && (current_user.id == @item.user_id || @item.order.present?)
  end
  
  def order_address_form_params
    params.require(:order_address_form).permit(:postal_code, :shipping_region_id, :city, :street_address, :building_name, :phone_number, :token).merge(user_id: current_user.id, item_id: params[:item_id])
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_address_form_params[:token],
      currency: 'jpy'
    )
  end

end
