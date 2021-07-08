class Reader < ActiveRecord::Base
  has_many :subscriptions
  has_many :magazines, through: :subscriptions


  def subscribe(magazine, price)
    Subscription.create(magazine_id: magazine.id, price: price, reader_id: self.id)
  end 

  def total_subcription_price
    prices_array = self.subscriptions.map {|sub| sub.price}
    prices_array.sum
  end 

  def cancel_subscription(magazine)
    sub_instance = self.subscriptions.find_by(magazine_id: magazine.id)
    sub_instance.destroy
  end 

  
end