require 'rails_helper'

RSpec.describe LockoutsWorker, type: :worker do
  describe "#work" do
    context "when given good input" do
      it "should create a new Lockout" do
        worker = LockoutsWorker.new
        raw = "timestamp=12_Feb_2017_19:44:59_EST&username=jdoe01&host=Johns-MacBook-Pro.local"
        worker.work(raw)
        
        expect(Lockout.where(username: "jdoe01", host: "Johns-MacBook-Pro.local").count).to eq 1
      end
    end
    
    context "when given bad input" do
      it "should write an error to the Logger" do
        worker = LockoutsWorker.new
        raw = "gobbledygook"
        
        expect{worker.work(raw)}.to raise_error ActiveModel::UnknownAttributeError
      end
    end
  end
end
