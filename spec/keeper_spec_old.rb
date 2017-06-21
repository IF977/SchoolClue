require "spec_helper"
require "keeper"

describe Keeper do
    regex_lat_lon = /[-+]?[0-9]*\.?[0-9]*/
    valid_input = /[A-Za-z]/
    regex_email = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    regex_number = /[0-9]/
    obj = Keeper.new
    
    it "Checar Instancia do keeper" do
        expect(obj).to be_an_instance_of(Keeper)
    end
    
    it "O nome é valido?" do 
        expect(obj.name).to match (valid_input)
    end
    it "telefone só tem números?" do
        expect(obj.phone).to match(regex_number)
    end
    it "O email é válido?" do
        expect(obj.email).to match(regex_email)
    end 
    it "A latitude é válida?" do
        expect(obj.lat.to_s).to match(regex_lat_lon)
    end
    it "A longitude é válida?" do
        expect(obj.lon.to_s).to match(regex_lat_lon)
    end
end