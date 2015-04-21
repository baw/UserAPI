require "rails_helper"

describe Api::V1::DirectoriesController do
  describe "#list" do
    context "safe directory name" do
      before :each do
        post :list, { directory: "log" }
      end
      
      it "should be successful" do
        expect(response).to be_success
      end
      
      it "should return the files and directories" do
        results = JSON.parse(response.body)
        
        expect(results).to eq(["development.log", "test.log"])
      end
    end
    
    context "unsafe directory name" do
      before :each do
        post :list, { directory: "rm -rf log" }
      end
      
      it "should not be successful" do
        expect(response).to_not be_success
      end
      
      it "should not be able to delete folders" do
        results = `ls`
        expect(results.include? "log").to be true
      end
      
      it "should return error message" do
        error = "ls: rm -rf log: No such file or directory\n"
        
        results = JSON.parse(response.body)
        expect(results["error"]).to eq error
      end
    end
  end
end
