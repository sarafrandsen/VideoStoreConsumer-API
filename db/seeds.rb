customer_data = JSON.parse(File.read('db/seeds/customers.json'))

customer_data.each do |customer|
  Customer.create!(customer)
end

JSON.parse(File.read('db/seeds/movies.json')).each do |movie_data|
  puts "getting movie data for #{movie_data["title"]}"
  movies = MovieWrapper.search(movie_data["title"])
  movies.first.save unless movies.empty?
end
