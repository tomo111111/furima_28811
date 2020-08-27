class Contract < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :receiver
end
