class KeeperController < ApplicationController
  def index
  end

  def location
    if request.post?
      @keeper_point = point
      set_point params
      if validate_point
    puts '---------------------------------------'
    puts @keeper_point[:latitude]
    puts @keeper_point[:longitude]
    puts @keeper_point[:radius]
    puts '---------------------------------------'
        @points_in_radius = search_points_in_radius(@keeper_point)
        render :list
      else
        format.json { render json: @keeper_point, status: :unprocessable_entity }
      end
    else
        @keeper_point = point
        render :location
    end
  end

  def list
  end

  def rank
  end
  private
  
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
