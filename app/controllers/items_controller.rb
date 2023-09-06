class ItemsController < ApplicationController
  before_action :move_to_sessions_new, only: [:new]
  # indexアクション定義
  def index
  end

  # newアクション定義
  def new
    # @item = Item.new
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

end
