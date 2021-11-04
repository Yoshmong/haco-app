class Area < ActiveHash::Base

  self.data = [
    { id: 0, name: 'エリアを選択してください' },
    { id: 1, name: '高松市' },
    { id: 2, name: '東讃エリア' },
    { id: 3, name: '中讃エリア' },
    { id: 4, name: '西讃エリア' },
    { id: 5, name: '西讃エリア' },
    { id: 6, name: '島エリア' }
  ]

  include ActiveHash::Associations
  has_many :spots
end
