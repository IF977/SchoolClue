class Keeper
   def initialize
   end
   
   def google params
       @site = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?'
       @key = 'AIzaSyA19kDjLjRhABuGt-xeBRtoAZ2qEXU3FWo'
       @keywords = '%22escolas%20municipais%20recife%20pernambuco%20brasil%22'
       @response = HTTParty.get("#{@site}key=#{@key}&location=#{params[:latitude]},#{params[:longitude]}&radius=#{params[:radius]}&keyword=#{@keywords}")
       @schools = (JSON.parse @response.body)["results"]
       @schools = @schools.each {|x| x["geometry"]["location"]["distance"] = calculate_point(params,x["geometry"]["location"]) }
       return @schools
   end
   
   def dadosAbertos
       @response = HTTParty.get("http://dados.recife.pe.gov.br/api/action/datastore_search_sql?sql=SELECT%20DISTINCT%20CE.nome%20,%20AC.nome_atividade%20,%20CE.telefone%20,%20CE.email%20from%20%221a6c0999-7ae4-428f-9020-d60186d6dc01%22%20CT%20,%20%22bb8b70d4-4204-40d3-bc77-409a1651b8b9%22%20CE%20,%20%22bb1183a0-dac1-474a-8579-3137294ef942%22%20AC%20WHERE%20CT.inep_escola%20=%20CE.inep_escola%20and%20%28AC.codigo_atividade%20=%20CT.codigo_atividade1%20or%20CT.codigo_atividade2%20=AC.codigo_atividade%20OR%20CT.codigo_atividade3%20=AC.codigo_atividade%20OR%20CT.codigo_atividade4%20=AC.codigo_atividade%20OR%20CT.codigo_atividade5%20=AC.codigo_atividade%29")
       return (JSON.parse @response.body)["result"]["records"]
   end

    def calculate_point(origin, destination)
        @lon_origin = origin[:longitude].to_f * Math.cos(origin[:latitude].to_f)
        @lon_destination = destination["lng"].to_f * Math.cos(destination["lat"].to_f)
        return  (((origin[:latitude].to_f - destination["lat"].to_f) * 110.547) ** 2 + ((@lon_origin - @lon_destination ) * 111.320 ) ** 2 ) ** 0.5
    end
end
