class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases
  
  with_options presence: true do
    validates :nickname 
    validates :email
    validates :password,        format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
    validates :last_name,       format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/}
    validates :first_name,      format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/}
    validates :kana_last_name,  format: { with: /\A[ァ-ヶー－]+\z/}
    validates :kana_first_name, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :birthday 
  end  
end
