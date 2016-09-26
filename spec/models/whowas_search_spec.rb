require 'rails_helper'

RSpec.describe WhowasSearch, type: :model do
  describe "#search!" do
    before do
      stub_whowas_methods
    end

    context "when a search is successful" do
      let(:search) { build(:whowas_search) }
      before do
        search.search!
      end        
      it "saves the username to an instance variable" do       
        expect(search.username).to eq("johndoe1")
      end
      it "saves the results to an instance variable" do
        expect(search.results).to eq([
          {"service 1" => "raw log 1"},
          {"service 2" => "raw log 2"}
        ])
      end
    end
    context "when a search has no results" do
      let(:search) { build(:search_with_no_results) }
      before do
        search.search!
      end      
      it "has an empty username" do
        expect(search.username).to eq("")
      end
      it "has 'No results found.' in the results" do
        expect(search.results).to include({"service 1" => "No results found."})
      end
    end
    context "when the search raises an error" do
      let(:search) { build(:invalid_search) }
      before do
        search.search!
      end       
      it "has an empty username" do
        expect(search.username).to eq("")
      end
      it "has the error in the results" do
        expect(search.results).to include({"service 1" => "Whowas::InvalidInput: Invalid IP Address"})
      end        
    end
  end
end
