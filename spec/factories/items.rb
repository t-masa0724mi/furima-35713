FactoryBot.define do
  factory :item do

    id                 { 1 }
    name               {'ラージャン'}
    description        {'捕獲して飼い慣らしました'}
    category_id        { 2 } 
    condition_id       { 2 }
    shipping_charge_id { 2 }
    shipping_area_id   { 2 }
    day_to_ship_id     { 2 }
    price              { 1000 }
    association        :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/img_rajang01_l.png'), filename: 'img_rajang01_l.png')
    end  
  end
end
