class ItemsController < ApplicationController
  before_action :move_to_sessions_new, only: [:new]
  # indexアクション定義
  def index
  end

  # newアクション定義
  def new
    @item = Item.new
  end

  # createアクション定義
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # ここから下privateメソッド
  private
  def move_to_sessions_new
    # ログアウト状態の時に実行される
    unless user_signed_in?
      # ユーザーログインページにリダイレクトする
      redirect_to new_user_session_path
    end
  end

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :delivery_charge_id, :pref_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

end
