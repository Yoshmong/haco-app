class Spot < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  has_many :events, dependent: :destroy
  has_one_attached :image

  validates :area_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください' }
end
