namespace :pk do

  desc "fetch data fron API and populate DB"
  task  populate: :environment do

    Pokemon.destroy_all
    progress = ProgressBar.create(title: 'Pokemons', starting_at: 0, total: 778)
    200.times do |i|
      step = 40
      pokemons = HTTParty.get("http://pokeapi.co/api/v1/pokemon?limit=#{step}&offset=#{step * i }")['objects']
      # binding.pry
      ActiveRecord::Base.transaction do
        pokemons.each do |data|
          if data['sprites'].empty?
            avatar = "http://www.gizmodo.fr/wp-content/uploads/2013/01/Pokeball.png"
          else 
            image = HTTParty.get("http://pokeapi.co#{data['sprites'][0]['resource_uri']}")['image']
            avatar = "http://pokeapi.co#{image}"
          end
          Pokemon.create(data: data, avatar: avatar)
          progress.increment
        end
      end
    end


    puts "--------- Task complete ---------"
    puts "--------- #{Pokemon.count} pokemons imported ---------"
  end
end
