Rails.application.routes.draw do
  # ルートにアクセスするとitemsコントローラーの
  # indexアクションを呼び出す
  root to: "items#index"
end
