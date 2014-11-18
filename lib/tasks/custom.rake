namespace :pk do

  def random_longitude
    rand(-180.000000000...180.000000000)
  end

  def random_latitude
    rand(-90.000000000...90.000000000)
  end

  desc "fetch data fron API and populate DB"
  task  populate: :environment do

    API = "http://pokeapi.co"
    progress = ProgressBar.create(title: 'Pokemons', starting_at: 0, total: 778)
    Pokemon.destroy_all
    1.times do |i|
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

  task reports: :environment do
    ActiveRecord::Base.transaction do
      Pokemon.find_each do |pokemon|
        3.times do
          pokemon.reports.create(
            latitude: random_latitude,
            longitude: random_longitude
          )
        end
      end
    end
  end

  task desc: :environment do

    API = "http://pokeapi.co"
    progress = ProgressBar.create(title: 'update description', starting_at: 0, total: 778)
    pokemons = Pokemon.all
    ActiveRecord::Base.transaction do
      pokemons.each do |p|
        if p.data['descriptions'][0]['resource_uri'].empty?
          desc = "No life, nothing to tell about him"
        else
          des = p.data['descriptions'][0]['resource_uri']
          desc = HTTParty.get("#{API}#{des}")['description']
        end
        Pokemon.update(p.id,
          description: desc
        )

        progress.increment
      end
    end
  end

  task tournament: :environment do
    ActiveRecord::Base.transaction do
      Tournament.create(
        name: 'League Pokemon',
        desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris at sapien maximus, porttitor lectus vitae, mollis velit. Cras fringilla vestibulum maximus. Duis turpis odio, fermentum eu leo sed, volutpat finibus dui. Proin eget volutpat mauris. Mauris quis orci eu elit porta commodo. Vivamus odio ipsum, vulputate vel diam a, ultricies eleifend quam. Curabitur et risus diam. Cras non erat fringilla, viverra nunc sit amet, fermentum orci. Fusce molestie lectus ut tortor varius, vel dapibus sem auctor. Suspendisse nec aliquet nunc, non varius enim. Etiam lacinia tincidunt ex vel vehicula. Quisque quis ante ex. ',
        date: '2014-11-21 12:00:00'
      )
    end
  end
  # task team: environment do

  #   poketypes = HTTParty.get("http://pokeapi.co/api/v1/type?limit=0")['objects']['name']
  #   nb_types = poketypes.count
  #   ActiveRecord::Base.transaction do
  #     Team.create(
  #       type_team: 
  #       )
  #   end
  # end

  task reset: :environment do
    `rake db:drop:all`
    `rake db:create:all`
    `rake db:migrate`
    `rake pk:populate`
    `rake pk:vote`
    `rake assets:clobber`
    `rake assets:precompile RAILS_ENV=production`
  end

  task reset_heroku: :production do
    `heroku run rake db:drop:all`
    `heroku run rake db:create:all`
    `heroku run rake db:migrate`
    `heroku run rake pk:populate`
    `heroku run rake pk:vote`
  end

end
