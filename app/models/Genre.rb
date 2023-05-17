class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'レディース' },
    { id: 3, name: 'メンズ' },
    { id: 4, name: 'ベビーキッズ' },
    { id: 5, name: 'インテリア住まい小物' },
    { id: 6, name: '本音楽ゲーム' },
    { id: 7, name: 'おもちゃホビーグッズ' },
    { id: 8, name: '家電スマホカメラ' },
    { id: 9, name: 'スポーツレジャー' },
    { id: 10, name: 'ハンドメイド' },
    { id: 11, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end
