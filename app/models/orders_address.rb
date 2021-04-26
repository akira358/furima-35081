class OrdersAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :build, :street, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :street
    validates :user_id
    validates :item_id
    validates :phone_number, length: {maximum:11}
    validates :token
  end
    validates :phone_number,numericality: {only_integer: true}
    
  def save
    order = Order.create(item_id: item_id, user_id: user_id )
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, build: build, street: street, phone_number: phone_number, orders_id: order)
  end
end



  
