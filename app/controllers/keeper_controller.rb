class KeeperController < ApplicationController
  
  def index
  end

  def form
#    if request.post?
#      @keeper_point = point
#      set_point params
#      if validate_point
#        @points_in_radius = search_points_in_radius(@keeper_point)
#        render action: "list"
#      end
#    end
  end

  def rank
    @schools_in_range = Google.new(params).results
    @schools_in_open_data = Dados.new.results
    @schools_final_list = Array.new
    
    for school_in_google in @schools_in_range
      @discipline_list = Array.new
      for school_in_dados in @schools_in_open_data
        if string_difference_percent(school_in_google["name"], school_in_dados["nome"])
          @discipline_list.push(school_in_dados)
        end
      end
      school_in_google["atividades_complementares"] = @discipline_list
      @schools_final_list.push(school_in_google)
      #puts @schools_final_list.length
      #puts(@schools_final_list.first.each {|key, value| puts "#{key} is #{value}" })
    end
    
    #puts("---------------------------------------------------------------------------------------------")
    #@schools_in_range.results.each {|x| puts(x["geometry"]["location"]["distance"])}
    #@schools_final_list = @schools_in_range.results.each {|school_in_google| @schools_in_open_data.results.each {|school_in_dados| (string_difference_percent(school_in_google["name"], school_in_dados["nome"]) > 0.7) ? school_in_google.merge(school_in_dados) : school_in_google}}

    #@schools_in_range.results.each {|school_in_google| @schools_in_open_data.results.each {|school_in_dados| (string_difference_percent(school_in_google["name"], school_in_dados["nome"]) > 0.7) ? true : false}}
    ##puts(@schools_final_list.each{|x|puts(x)})


    #@schools_in_range.results.each {|x| x.each{|key,value| puts "#{key}:#{value}"}}
    #puts('-------------------------------------------------------------------------------------')
    #puts(string_difference_percent('Municipal Boa Esperança'.downcase,'ESCOLA MUNICIPAL BOA ESPERANCA'.downcase))
    #puts('-------------------------------------------------------------------------------------')
    #puts('-------------------------------------------------------------------------------------')
    #puts(string_difference_percent('E','e'))
    #puts('-------------------------------------------------------------------------------------')
  end
  
  def contato
  end
  
  private
  
  def string_difference_percent(a, b)
    #jarow = String::Similarity.levenshtein_distance
    @cosine = String::Similarity.cosine(a.downcase.split("escola").join("").split("municipal").join("").split(" ").join(""),b.downcase.split("escola").join("").split("municipal").join("").split(" ").join(""))
    @levenshtein = String::Similarity.levenshtein_distance(a.downcase.split("escola").join("").split("municipal").join("").split(" ").join(""),b.downcase.split("escola").join("").split("municipal").join("").split(" ").join(""))
    #puts(@resultado)
    if @levenshtein < 10 and @cosine > 0.70
      return true
    else
      return false
    end
  end
  
  def percent(a, b)
    return @resultado
  end
  
  def regra_de_tres (proporcao,grandezas)
    return 1 / ((grandeza[0]/grandeza[1]) **  proporcao) 
  end
  
  def calculate_point(origin, destination, radius)
    @lon_origin = origin[:longitude] * Math.cos(origin[:latitude] )
    @lon_destination = destination.lon * Math.cos(destination.lat)
    
    @distance_within_points =  (((origin[:latitude] - destination.lat) * 110.547) ** 2 + ((@lon_origin - @lon_destination ) * 111.320 ) ** 2 ) ** 0.5
    
    if @distance_within_points <= radius
      return true
    end
    return false
  end
    #Latitude: 1 deg = 110.574 km
    #Longitude: 1 deg = 111.320*cos(latitude) km
    # Math.cos(Math::PI) #=> -1.0
    
    
  def search_points_in_radius(location_point)
    @all_schools = Keeper.all
    @result = []
    @all_schools.each do |school|
      if calculate_point(location_point,school, location_point[:radius])
        @result.push school
      end
    end
    return @result
  end
  def point 
        @point = Hash.new
        @point[:latitude] = 0.0
        @point[:longitude] = 0.0
        @point[:radius] = 0.0
        @point[:errors] = {}
        return @point
    end
    def set_point param
        @point[:latitude] = param['latitude'].to_f
        @point[:longitude] = param['longitude'].to_f
        @point[:radius] = param['radius'].to_f
    end
    def validate_point
        if @point[:latitude] != 0.0 and @point[:longitude] != 0.0 and @point[:radius] != 0.0
            return true
        else
            point['errors'] = {'full_messages' => ['você não colocou algum dos campos ou eles não são validos']}
        end
    end
end
