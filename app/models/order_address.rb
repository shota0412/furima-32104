class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip, :prefecture_id, :city, :address, :building, :phone_number, :order_id

  with_options presence: true do
    validates :zip, length: { is: 8 } , format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zip: zip, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end