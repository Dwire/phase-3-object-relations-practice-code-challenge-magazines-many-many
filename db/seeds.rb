puts "Clearing old data..."
Subscription.destroy_all
Magazine.destroy_all
Reader.destroy_all

puts "Seeding magazines..."
magazines = ["The New Yorker", "National Geographic", "Wired", "People", "Cosmopolitan", "Time", "US Weekly", "New York Magazine"]
# Create sample magazines
magazines.each do |magazine|
  Magazine.create(title: magazine)
end

puts "Seeding readers..."
# Create 10 random Readers
10.times do
  Reader.create(name: Faker::Name.name, email: Faker::Internet.email)
end

puts "Seeding subscriptions..."
# Create 20 random subscriptions
# Subscription.create(reader_id: Reader.first.id, magazine_id: Magazine.first.id, price: rand(5..100))
# Subscription.create(reader_id: Reader.first.id, magazine_id: Magazine.second.id, price: rand(5..100))
# Subscription.create(reader_id: Reader.second.id, magazine_id: Magazine.first.id, price: rand(5..100))
# Subscription.create(reader_id: Reader.first.id, magazine_id: Magazine.third.id, price: rand(5..100))
# Subscription.create(reader_id: Reader.third.id, magazine_id: Magazine.third.id, price: rand(5..100))

50.times do 
  Subscription.create(reader_id: Reader.all.sample.id, magazine_id: Magazine.all.sample.id, price: rand(5..100))
end 



puts "Done!"