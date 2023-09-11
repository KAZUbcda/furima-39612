class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :name,               presence: true
  validates :explanation,        presence: true
  validates :category_id,        presence: true
  validates :condition_id,       presence: true
  validates :delivery_charge_id, presence: true
  validates :pref_id,            presence: true
  validates :days_to_ship_id,    presence: true
  validates :price,              presence: true
  validates :price,              numericality: true, inclusion: { in: 300..9_999_999, message: 'は300~9,999,999の範囲で指定してください' }, allow_blank: true
  validates :price,              numericality: {only_integer: true}
  validates :image,              presence: true

  validates :category_id,        numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,       numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :pref_id,            numericality: { other_than: 1, message: "can't be blank" }
  validates :days_to_ship_id,    numericality: { other_than: 1, message: "can't be blank" }

  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :pref
  belongs_to :days_to_ship

  # has_one    :purchase_record

  has_one_attached :image

  def was_attached?
    self.image.attached?
  end
end
