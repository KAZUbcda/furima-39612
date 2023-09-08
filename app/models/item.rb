class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :name,               presence: true
  validates :explanation,        presence: true
  validates :category_id,        presence: true
  validates :condition_id,       presence: true
  validates :delivery_charge_id, presence: true
  validates :pref_id,            presence: true
  validates :days_to_ship_id,    presence: true
  # with_options presence: true, inclusion: { in: 300..9_999_999, message: 'は300~9,999,999の範囲で指定してください' }, format: { with: /\A[0-9]+$\z/, message: 'は半角数字を使用してください' } do
  # PRICE_REGEX = /\A[0-9]+\z/
  # validates_format_of :price,    with: PRICE_REGEX, message: 'は半角数字を使用してください'
  validates :price,              numericality: true, inclusion: { in: 300..9_999_999, message: 'は300~9,999,999の範囲で指定してください' }
  validates :user,               presence: true
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

  has_one    :purchase_record

  has_one_attached :image

  def was_attached?
    self.image.attached?
  end
end
