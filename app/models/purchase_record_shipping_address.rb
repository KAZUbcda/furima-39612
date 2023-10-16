class PurchaseRecordShippingAddress
  include ActiveModel::Model
  attr_accessor :post_code, :pref_id, :municipalities, :street_address, :bldg_name, :tel_number, :user_id, :item_id, :token

  # ここにバリデーションの処理を書く
  validates :token,     presence: true
  validates :post_code, presence: true
  validates :post_code,
            format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は半角数字「3桁ハイフン4桁」の形式で入力してください', allow_blank: true }
  validates :pref_id, numericality: { other_than: 1, message: "を設定してください" }
  validates :municipalities, presence: true
  validates :street_address, presence: true
  validates :tel_number, presence: true
  validates :tel_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁以上11桁以内の半角数字を入力してください', allow_blank: true }
  validates :user_id, presence: true
  validates :item_id, presence: true
  

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(post_code: post_code, pref_id: pref_id, municipalities: municipalities,
                           street_address: street_address, bldg_name: bldg_name, tel_number: tel_number, purchase_record_id: purchase_record.id)
  end
end
