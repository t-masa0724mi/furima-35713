FactoryBot.define do
  factory :purchase_shipping_address do


    item_id                { 1 }
    user_id                { 1 }
    token                  {"tok_abcdefghijk00000000000000000"}
    postal_code            {"111-1111"}
    shipping_area_id       { 2 }
    municipality           {"ああああ"}
    house_number           {"あ11-11"}
    phone_number           {"00000000000"}

  end
end
