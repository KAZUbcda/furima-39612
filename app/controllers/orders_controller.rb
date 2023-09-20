class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_record_shipping_address = PurchaseRecordShippingAddress.new
  end

  def create
    # binding.pry
    @item = Item.find(params[:item_id])
    @purchase_record_shipping_address = PurchaseRecordShippingAddress.new(shipping_address_params)
    if @purchase_record_shipping_address.valid?
      @purchase_record_shipping_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def shipping_address_params
    params.require(:purchase_record_shipping_address).permit(:post_code, :pref_id, :municipalities, :street_address, :bldg_name, :tel_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

end
