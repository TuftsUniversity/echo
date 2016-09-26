require "spec_helper"

shared_examples "a_search_method" do |input|
  describe "#validate" do
    context "given valid input" do
      it "returns true" do
        expect(searcher.validate(input[:valid])).to be true
      end
    end

    context "missing a required input" do
      it "returns an error message" do
        expect{searcher.validate(input[:missing])}.to raise_error Whowas::Errors::InvalidInput
      end
    end

    context "given invalid inputs" do
      it "returns an error message" do
        input[:invalid].each do |invalid_input|
          expect{searcher.validate(invalid_input)}.to raise_error Whowas::Errors::InvalidInput
        end
      end
    end
  end

  describe "#format" do
    it "returns a hash with fields required by adapter" do
      expect(searcher.format(input[:valid])).to include(*input[:adapter_required_keys])
    end
  end 

  describe "#parse" do
    it "returns a hash" do
      expect(searcher.parse(input[:valid_result])).to be_a Hash
    end
  end 

  private

  def searcher
    described_class.new
  end
end
