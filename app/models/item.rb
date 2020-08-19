class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :ship_from
  belongs_to_active_hash :ship_date

  validates :name, presence: true
  # with_options presence: true do
  #   validates :name
  #   validates :text
  #   validates :category
  #   validates :condition
  #   validates :postage
  #   validates :ship_from
  #   validates :ship_date
  #  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  # end
end
