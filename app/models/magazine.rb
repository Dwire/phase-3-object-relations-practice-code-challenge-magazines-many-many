class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions


  def email_list
    email_array = self.readers.map {|reader| reader.email}
    email_array.join("; ")
  end 


  def self.most_popular
    self.all.max_by {|mag| mag.subscriptions.count}
  end 
end