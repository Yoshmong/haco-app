class Spot < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  has_many :events, dependent: :destroy

  # presence: true do
  has_one_attached :image

  validate  :image_content_type, if: :was_attached?
  validates :area_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください' }
end

private

def image_content_type
  extension = ['image/png', 'image/jpg', 'image/jpeg']
  errors.add(:image, "の拡張子が間違っています") unless image.content_type.in?(extension)
end

def was_attached?
  self.image.attached?
end