class PurchaseShippingAddress

  include ActiveModel::Model
  attr_accessor  :postal_code, :shipping_area_id, :municipality, :house_number, :building_name, :phone_number, :item_id, :user_id, :token
  
  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :municipality
    validates :house_number
    validates :phone_number, length: { maximum: 11, message: 'is too long' }
    validates :phone_number, length: { minimum: 10, message: 'is too short'}
    validates :phone_number, numericality: { only_integer: true}
    
    validates :token
  end
  

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)

    ShippingAddress.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end   