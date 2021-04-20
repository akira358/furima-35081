class Item < ApplicationRecord
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :category_id
    validates :text
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :schedule_id
    # validates :shopping_fee format:{only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
    validates :shipping_fee_status_id
    validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :info_id
    validates :prefecture_id
    validates :schedule_id
    validates :shipping_fee_status_id
  end  
  
  VALID_PASSWORD_REGEX =/\A[a-z0-9]+\z/i
  validates :shipping_fee_status_id, presence: true,
            format: { with: VALID_PASSWORD_REGEX,
             message: "は半角6文字以上の半角英数字"}


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :info
  belongs_to :prefecture
  belongs_to :schedule
  belongs_to :shipping_fee
end
