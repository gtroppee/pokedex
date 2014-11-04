namespace :pk do

  desc "fetch data fron API and populate DB"
  task  populate: :environment do
    progress = ProgressBar.create(title: 'Pokemons', starting_at: 0, total: 778)
    Pokemon.destroy_all
    4.times do |i|
      step = 200
      pokemons = HTTParty.get("http://pokeapi.co/api/v1/pokemon?limit=#{step}&offset=#{step * i}")['objects']
      # binding.pry
      ActiveRecord::Base.transaction do
        pokemons.each do |data|
          Pokemon.create(data: data)
          progress.increment
        end
      end
    end
    puts "--------- Task complete ---------"
    puts "--------- #{Pokemon.count} pokemons imported ---------"
  end
end
