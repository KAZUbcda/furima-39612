class OrdersController < ApplicationController
  before_action :set_item,             only: [:index, :create]
  before_action :check_purchase,       only: [:index]
  before_action :move_to_sessions_new, only: [:index]
  before_action :correct_user,         only: [:index]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @purchase_record_shipping_address = PurchaseRecordShippingAddress.new
    @shipping_address = ShippingAddress.new
  end

  def create
    # @purchase_record_shipping_address = PurchaseRecordShippingAddress.new(shipping_address_params)
    @purchase_record_shipping_address = PurchaseRecordShippingAddress.new(purchase_record_shipping_address_params)
    # @shipping_address = ShippingAddress.new(shipping_address_params)
    if @purchase_record_shipping_address.valid?
      pay_item
      @purchase_record_shipping_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  # def shipping_address_params
  #   params.require(:purchase_record_shipping_address).permit(:post_code, :pref_id, :municipalities, :street_address, :bldg_name, :tel_number)
  # end

  def purchase_record_shipping_address_params
    params.require(:purchase_record_shipping_address).permit(:post_code, :pref_id, :municipalities, :street_address, :bldg_name, :tel_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: shipping_address_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  # 売却済み商品の購入ページに遷移させない処理
  def check_purchase
    return unless @item.purchase_record.present?

    redirect_to '/'
  end

  # ログインしていないユーザーがURLを直接入力してもページ遷移できない処理
  def move_to_sessions_new
    # ログアウト状態の時に実行される
    return if user_signed_in?

    # ユーザーログインページにリダイレクトする
    redirect_to new_user_session_path
  end

  # ログインしているユーザーと商品を出品したユーザーが同一の場合、
  # 商品購入ページに遷移できない処理
  def correct_user
    # 商品のユーザーIDと現在ログインしているユーザーのIDが
    # 一致しない時に実行される
    return unless @item.user_id == current_user.id

    redirect_to '/'
  end
end
