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
    @schools_in_range = Google.new(params)
    @schools_in_open_data = Dados.new
    #puts("---------------------------------------------------------------------------------------------")
    #@schools_in_range.results.each {|x| puts(x["geometry"]["location"]["distance"])}
  end
  
  def contato
  end
  
  private
  
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
