class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_date

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :category_id
    validates :status_id
    validates :delivery_cost_id
    validates :prefecture_id
    validates :delivery_date_id
    validates :price, numericality: {greater_than_or_equal_to: 100,less_than: 10000000}, format: {with: /\A[0-9]+\z/}
  end
end
