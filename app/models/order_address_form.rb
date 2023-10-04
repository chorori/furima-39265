class OrderAddressForm
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_region_id, :city, :street_address, :building_name, :phone_number, :user_id, :item_id, :token

  validates :token, presence: { message: "can't be blank" }
  validates :postal_code, presence: { message: "can't be blank" }, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
  validates :shipping_region_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, presence: { message: "can't be blank" }
  validates :street_address, presence: { message: "can't be blank" }
  validates :phone_number, presence: { message: "can't be blank" }, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input only number" }, length: { in: 10..11, message: "is too short" }
  validates :user_id, presence: { message: "can't be blank" }
  validates :item_id, presence: { message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_region_id: shipping_region_id, city: city, street_address: street_address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end