class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions


  def email_list 
    email_array = self.readers.map {|reader| reader.email}
    email_array.join(", ")
  end 


  def self.most_popular
    # Magazine.all
    # top_mag = Magazine.first

    # self.all.each do |mag|
    #   if mag.subscriptions.count > top_mag.subscriptions.count
    #     top_mag = mag 
    #   end 
    # end 

    # top_mag


    self.all.max_by {|mag|  mag.subscriptions.count}
  end 

end