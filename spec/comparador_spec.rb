require "rails_helper"

describe "#comparestring" do
	obj = KeeperController.new
	it "should be defined" do
		 expect {obj.send(:comparestring,"escola do seu joão", "escola municipal do seu joão")}.to_not raise_error
	end
	
	it "returns true when one of the parameters has all its words inside the other" do
		obj.send(:comparestring,"escola municipal engenheiro josé adalberto","escola josé adalberto").should be true
	end
	
	it "returns false when none of the parameters has its words inside the other" do
		obj.send(:comparestring,"escola municipal epamenondas","escola municipal casa").should be false
	end
	
	
	it "should reject numbers" do
		expect {obj.send(:comparestring,1,23)}.to raise_error("Não é permitido números")
	end
end


