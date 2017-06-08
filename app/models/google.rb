class Google
   def initialize params
       @site = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?'
       @key = 'AIzaSyA19kDjLjRhABuGt-xeBRtoAZ2qEXU3FWo'
       @keywords = '%22escolas%20municipais%20recife%20pernambuco%20brasil%22'
       @response = HTTParty.get("#{@site}key=#{@key}&location=#{params[:latitude]},#{params[:longitude]}&radius=#{params[:radius]}&keyword=#{@keywords}")
       
       @schools = (JSON.parse @response.body)["results"]
       @schools = @schools.each {|x| x["geometry"]["location"]["distance"] = calculate_point(params,x["geometry"]["location"]) }
       @schools = @schools.sort{ |v| v["geometry"]["location"]["distance"] }
       
   end
   def results
       return @schools
   end
   
    def calculate_point(origin, destination)
         
        @lon_origin = origin[:longitude].to_f * Math.cos(origin[:latitude].to_f)
        @lon_destination = destination["lng"].to_f * Math.cos(destination["lat"].to_f)
        return  (((origin[:latitude].to_f - destination["lat"].to_f) * 110.547) ** 2 + ((@lon_origin - @lon_destination ) * 111.320 ) ** 2 ) ** 0.5
    end
end
