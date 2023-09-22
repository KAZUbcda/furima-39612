class ShippingAddress < ApplicationRecord
  # validates :post_code,       presence: true
  # validates :pref_id,         presence: true
  # validates :municipalities,  presence: true
  # validates :street_address,  presence: true
  # validates :bldg_name,       presence: true
  # validates :tel_number,      presence: true
  # validates :purchase_record, presence: true

  # validates :pref_id,         numericality: { other_than: 1, message: "can't be blank" }

  belongs_to :purchase_record
end
