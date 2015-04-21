require "rails_helper"

describe Api::V1::ComponentsController do
  describe "#index" do
    before :each do
      get :index
    end
    
    it "should be successful" do
      expect(response).to be_success
    end
    
    it "should contain PostgreSQL status" do
      body = JSON.parse(response.body)
      
      expect(body["PostgreSQL"]).to include "CONNECTION"
    end
  end
end
