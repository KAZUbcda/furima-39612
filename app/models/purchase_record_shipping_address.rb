class PurchaseRecordShippingAddress
  include ActiveModel::Model
  attr_accessor :post_code, :pref_id, :municipalities, :street_address, :bldg_name, :tel_number, :user_id, :item_id

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipalities
    validates :street_address
    validates :tel_number
    validates :user_id
    validates :item_id
  end
  validates :pref_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id )
    ShippingAddress.create(post_code: post_code, pref_id: pref_id, municipalities: municipalities, street_address: street_address, bldg_name: bldg_name, tel_number: tel_number, purchase_record_id: purchase_record.id)
  end
end