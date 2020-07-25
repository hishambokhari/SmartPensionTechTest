require "catalog"

describe Catalog do
  let(:file_path) {"spec/webserver.log"} # where the web server file is located

  describe "#initialize" do
    it "takes the log file as an argument" do
      expect(Catalog.instance_method(:initialize).arity).to eq(1) # .arity returns an indication od arguments accepted by a method. In this case its only 1 - the (file path)
    end
  end

  describe "#parse" do
    it "should consist of two arrays" do
      expect(Catalog.new(file_path).parse.first).to be_a Array
      expect(Catalog.new(file_path).parse.last).to be_a Array
    end
  end

  describe "#fill_pages" do
    it "returns an array" do
      expect(Catalog.new(file_path).fill_pages).to be_a Array
    end
  end

  describe "#fill_hash" do
    it "should fill the hash with pages as the key and the coordinates as an array of values" do
      expect(Catalog.new(file_path).fill_hash).to be_a Hash
    end
  end

  describe "#page_visits" do
    it "should return a hash" do
      expect(Catalog.new(file_path).page_visits).to be_a Hash
    end
    it "returns the correct set of keys" do
      expect(Catalog.new(file_path).page_visits.keys).to be_eql ["/contact/", "/products/3", "/home", "products/1", "/index", "/about", "/products/2"]
    end                                                   
  end
end