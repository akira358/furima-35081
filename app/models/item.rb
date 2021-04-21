class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :name
    validates :category_id
    validates :text
     validates :shipping_fee_status_id
    validates :prefecture_id
    validates :schedule_id
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :info_id
    validates :prefecture_id
    validates :schedule_id
    validates :shipping_fee_status_id
  end  
  
  
  


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :info
  belongs_to :prefecture
  belongs_to :schedule
  belongs_to :shipping_fee_status
  
end
