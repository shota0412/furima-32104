class Category < ActiveHash::Base
  include ActiveHash::Associations
  has_many :items

  self.data = [
    {id: 1, data: '---'},
    {id: 2, data: 'レディース'},
    {id: 3, data: 'メンズ'},
    {id: 4, data: 'ベビー・キッズ'},
    {id: 5, data: 'インテリア・住まい・小物'},
    {id: 6, data: '本・音楽・ゲーム'},
    {id: 7, data: 'おもちゃ・ホビー・グッズ'},
    {id: 8, data: '家電・スマホ・カメラ'},
    {id: 9, data: 'スポーツ・レジャー'},
    {id: 10, data: 'ハンドメイド'},
    {id: 11, data: 'その他'},
  ]
end
