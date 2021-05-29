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
    validates :password,        format: { with: /\A[a-zA-Z0-9]+\z/}
    validates :last_name,       format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :first_name,      format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :kana_last_name,  format: { with: /\A[ァ-ヶー－]+\z/}
    validates :kana_first_name, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :birthday 
  end  
end
