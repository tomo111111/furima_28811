class Item < ApplicationRecord
  belongs_to :user
  has_one :contract
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :ship_from
  belongs_to_active_hash :ship_date

    
  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :category_id,numericality: { other_than: 1 }
    validates :condition_id,numericality: { other_than: 1 }
    validates :postage_id,numericality: { other_than: 1 }
    validates :ship_from_id,numericality: { other_than: 1 }
    validates :ship_date_id,numericality: { other_than: 1 }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}

  end
end
