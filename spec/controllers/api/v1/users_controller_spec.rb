require "rails_helper"

describe Api::V1::UsersController do
  describe "#authenticate" do
    context "with correct login info" do
      before :each do
        post :authenticate, { username: "user", password: "pass" }
      end
      
      it "should be successful" do
        expect(response).to be_success
      end
      
      it "should response that you were authenticated" do
        body = JSON.parse response.body
        
        expect(body.include? "authenticated").to be true
        expect(body["authenticated"]).to be true
      end
    end
    
    context "with incorrect login info" do
      before :each do
        post :authenticate, { username: Faker::Internet.user_name,
                              password: Faker::Internet.password }
      end
      
      it "should not be successful" do
        expect(response).to_not be_success
      end
      
      it "should response that you were not authenticated" do
        body = JSON.parse response.body
        
        expect(body.include? "authenticated").to be true
        expect(body["authenticated"]).to be false
      end
    end
  end
  
  describe "#index" do
    before :each do
      @city = "San Francisco"
      
      post :index, { city: @city }
    end
    
    it "should return the users with the right city" do
      body = JSON.parse response.body
      
      body.each do |u|
        expect(u["city"]).to eq @city
      end
    end
    
    it "should be group by profession" do
      body = JSON.parse response.body
      
      sorted = body.sort_by do |u|
        u[:profession]
      end
      
      expect(sorted).to eq body
    end
  end
end
