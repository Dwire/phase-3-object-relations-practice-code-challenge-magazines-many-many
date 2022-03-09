class Reader < ActiveRecord::Base
  has_many :subscriptions
  has_many :magazines, through: :subscriptions



  def subscribe(magazine, price)
    Subscription.create(reader_id: self.id, magazine_id: magazine.id, price: price)
  end

  def total_subcription_price
    # ---------- using each
    # total = 0

    # self.subscriptions.each do |sub|
    #   total += sub.price
    # end 
    
    # total
    
    # ---------- using map
    # sub_prices = self.subscriptions.map {|sub| sub.price}
    # sub_prices.sum

    # --------- using pluck & sum
    # self.subscriptions.pluck(:price).sum

    #---------- using just .sum and pasing an argument
    self.subscriptions.sum(:price)
  end 

  def cancel_subscription(magazine)
    found_subscription = self.subscriptions.find {|sub| sub.magazine_id == magazine.id}
    found_subscription.destroy
    
    
    # found_subscription_array = self.subscriptions.where(magazine_id: magazine.id)
    # found_subscription_array.destroy_all

  end 


end