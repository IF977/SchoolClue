require "spec_helper"
#require "keeper"

describe Keeper do
    regex_lat_lon = /[-+]?[0-9]*\.?[0-9]*/
    regex_number = /[0-9]/
    obj = Keeper.new
    
    
    it "Checar Instancia do keeper" do
        expect(obj).to be_an_instance_of(Keeper)
    end

    it "Quando coloca um params correto ele retorna uma lista" do 
        @teste = obj.google({:latitude => "-8.060589352854752",:longitude => "-34.887428283691406",:radius => "1000"})
        expect(@teste).not_to be_empty
    end
    
    it "Quando coloca um params vazio ele retorna uma lista vazia" do 
        @teste = obj.google({})
        expect(@teste).to be_empty
    end
    
    it "Quando DADOS ABERTOS retorna uma lista NÃO VAZIA?" do 
        @teste = obj.dadosAbertos()
        expect(@teste).not_to be_empty
    end
    
#    it "A latitude é válida?" do
#        expect(obj.latitude.to_s).to match(regex_lat_lon)
#    end
#    it "A longitude é válida?" do
#        expect(obj.longitude.to_s).to match(regex_lat_lon)
#    end
end