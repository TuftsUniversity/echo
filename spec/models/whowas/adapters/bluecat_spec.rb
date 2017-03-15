require "spec_helper"

module Whowas
  extend Configuration
  
  describe Bluecat, type: :adapter do

    def login_unless_logged_in
      # if Bluecat.class_eval("@@client").nil? || Bluecat.class_eval("@@cookie").nil? 
      # HOTFIX for bluecat session issue - FIXME
        login_message = {username: ENV["BLUECAT_USERNAME"], password: ENV["BLUECAT_PASSWORD"]}
        login_response = File.read("spec/support/fixtures/login_response.xml")
        
        savon.expects(:login).with(message: login_message).returns(login_response)
        
        @adapter.send(:client)
      # end
    end   
      
    describe "#search" do
      before(:all) do
        service_up(Whowas::Bluecat)
        @adapter = Whowas::Bluecat.new
      end
  
      context "with valid input" do      
        before(:each) do
          login_unless_logged_in
        end
      
        it "returns a result string if there is a match" do
          message = {configurationId: ENV["BLUECAT_ID"], macAddress: "01:23:45:67:89:ab"}
          response = File.read("spec/support/fixtures/mac_response.xml")

        login_message = {username: ENV["BLUECAT_USERNAME"], password: ENV["BLUECAT_PASSWORD"]}
        login_response = File.read("spec/support/fixtures/login_response.xml")
        
          savon.expects(:login).with(message: login_message).returns(login_response)          
          savon.expects(:get_mac_address).with(message: message).returns(response)

          expect(@adapter.search(valid_bluecat_input)).to eq "raw results string"
        end
        
        it "returns an empty string if there is no match" do
          message = {configurationId: ENV["BLUECAT_ID"], macAddress: "aa:bb:cc:dd:ee:ff"}
          response = File.read("spec/support/fixtures/empty_response.xml")

        login_message = {username: ENV["BLUECAT_USERNAME"], password: ENV["BLUECAT_PASSWORD"]}
        login_response = File.read("spec/support/fixtures/login_response.xml")
        
          savon.expects(:login).with(message: login_message).returns(login_response)          
          savon.expects(:get_mac_address).with(message: message).returns(response)    
                
          expect(@adapter.search(valid_bluecat_input_no_results)).to eq ""
        end
      end
      
      context "with invalid input" do
        before(:each) do
          login_unless_logged_in
        end
            
        it "raises Errors::InvalidInput" do
          expect{@adapter.search(invalid_bluecat_input)}.to raise_error(Whowas::Errors::InvalidInput)
        end
      end
      
      context "when the service is down or experiencing problems" do
        it "raises Errors::Service Unavailable" do
          Whowas::Bluecat.class_variable_set(:@@client, nil)
          Whowas::Bluecat.class_variable_set(:@@cookie, nil)
                    
          savon.expects(:login)
          
          expect{login_unless_logged_in}.to raise_error(Whowas::Errors::ServiceUnavailable)
        end
      end
    end
  end
end