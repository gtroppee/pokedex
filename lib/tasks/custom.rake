namespace :pk do

  desc "fetch data fron API and populate DB"
  task  populate: :environment do

    API = "http://pokeapi.co"
    progress = ProgressBar.create(title: 'Pokemons', starting_at: 0, total: 778)
    Pokemon.destroy_all
    16.times do |i|
      limit = 50
      pokemons = HTTParty.get("#{API}/api/v1/pokemon?limit=#{limit}&offset=#{limit * i}")['objects']
      # binding.pry
      ActiveRecord::Base.transaction do
        pokemons.each do |data|
          if data['sprites'].any?
            avatar = HTTParty.get("#{API}#{data['sprites'][0]['resource_uri']}")['image']
            avatar = "#{API}#{avatar}"
          else
            avatar = "http://www.google.fr/imgres?imgurl=http%3A%2F%2Fstatic.planetminecraft.com%2Ffiles%2Fresource_media%2Fscreenshot%2F1318%2FQuestion_mark_alternate_5357730.jpg&imgrefurl=http%3A%2F%2Fwww.planetminecraft.com%2Fblog%2Fwant-a-minecraft-server-trailer%2F&h=640&w=494&tbnid=yFKpmq0TBHbJrM%3A&zoom=1&docid=nTQSmeMxkMn9VM&ei=9_ZYVO25I6zdsATXyIHABA&tbm=isch&iact=rc&uact=3&dur=179&page=3&start=74&ndsp=32&ved=0CLYCEK0DMFs"
          end
          Pokemon.create(
            data: data, 
            avatar: avatar, 
            pkdx_id: data['pkdx_id'],
            name: data['name']
          )
          
          progress.increment
        end
      end
    end


    puts "--------- Task complete ---------"
    puts "--------- #{Pokemon.count} pokemons imported ---------"
  end

  task vote: :environment do
    ActiveRecord::Base.transaction do
      50.times do |voter|

        voter = (0...5).map { ('a'..'z').to_a[rand(26)] }.join
        3.times do
          Vote.create(
            pokemon: Pokemon.where(pkdx_id: (1..20)).sample,
            ip_address: voter,
            rating: (1..5).to_a.sample
          )
        end
      end
    end
  end

  task reset: :environment do
    `rake db:drop:all`
    `rake db:create:all`
    `rake db:migrate`
    `rake pk:populate`
  end

end
