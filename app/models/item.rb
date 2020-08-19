class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category, :condition, :postage, :ship_from, :ship_date
end
