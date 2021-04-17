class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :last_name, presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
  validates :first_name, presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
  validates :last_name_kana, presence: true,format: { with: /\A[ァ-ヶ一-]+\z/, message: '全角文字を使用してください' }
  validates :first_name_kana, presence: true,format: { with: /\A[ァ-ヶ一-]+\z/, message: '全角文字を使用してください' }
  validates :birth_date, presence: true
  validates :password,presence: true, length: {minimum: 6 }
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, presence: true,
            format: { with: VALID_PASSWORD_REGEX,
             message: "は半角6文字以上の半角英数字"}
  
  has_many :items
  has_many :orders
end
#last_nameとfirst_nameが漢字とひらがなであることを確認する正規表現が必要
#last_name_kanaとfirst_name_kanaがカタカナであることを確認する正規表現が必要

#presence: trueをまとめる

# with_options presence: true, do
#   validates :name
#   with_options  format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }, do
#   validates :last_name
#   validates :first_name
#   end
#   validates :last_name_kana, presence: true
#   validates :first_name_kana, presence: true
#   validates :birth_date, presence: true
# end