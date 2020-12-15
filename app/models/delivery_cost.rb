class DeliveryCost < ActiveHash::Base
  include ActiveHash::Associations
  has_many :items

  self.data = [
    { id: 1, data: '---' },
    { id: 2, data: '着払い(購入者負担)' },
    { id: 3, data: '送料込み(出品者負担)' }
  ]
end
