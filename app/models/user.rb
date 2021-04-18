class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :name,
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
    validates :last_name
    validates :first_name 
  end
  validates :name
  with_options presence: true do
  validates :last_name_kana format: { with: /\A[ァ-ヶ一-]+\z/, message: '全角文字を使用してください' }
  validates :first_name_kana format: { with: /\A[ァ-ヶ一-]+\z/, message: '全角文字を使用してください' }
  end
  validates :birth_date
  validates :password length: {minimum: 6 }
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, presence: true,
            format: { with: VALID_PASSWORD_REGEX,
             message: "は半角6文字以上の半角英数字"}
  
  has_many :items
  has_many :orders
end
