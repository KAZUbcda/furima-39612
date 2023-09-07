class Item < ApplicationRecord
  validates :name,               presence: true
  validates :explanation,        presence: true
  validates :category_id,        presence: true
  validates :condition_id,       presence: true
  validates :delivery_charge_id, presence: true
  validates :pref_id,            presence: true
  validates :days_to_ship_id,    presence: true
  validates :price,              presence: true
  validates :user,               presence: true

  belongs_to :user
  has_one :purchase_record

  has_one_attached :image

  def was_attached?
    self.image.attached?
  end
end
