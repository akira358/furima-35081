class OrdersAddress
  include ActiveModel::Model
  attr_accessor :text, :category_id, :info_id, :shipping_fee_status_id, :prefecture_id, :schedule_id, :price, :user_id

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

  def save
    orders = Order.create(price: price, user_id: user_id )
    Addres.create(image: image, name: name, category_id: category_id, text: text, :shipping_fee_status_id: shipping_fee_status_id, prefecture_id: prefecture_id, schedule_id: schedule_id, info_id: info_id)
  end
end



  
