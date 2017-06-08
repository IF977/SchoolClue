require "rails_helper"

RSpec.describe KeeperController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/").to route_to("keeper#index")
    end

    it "routes to #index" do
      expect(:get => "/keeper/index").to route_to("keeper#index")
    end
    
    it "routes to #form" do
      expect(:get => "/keeper/form").to route_to("keeper#form")
    end
    
    it "routes to #rank" do
      expect(:get => "/keeper/rank").to route_to("keeper#rank")
    end
    
    it "routes to #rank" do
      expect(:post => "/keeper/rank").to route_to("keeper#rank")
    end
    
 end
end