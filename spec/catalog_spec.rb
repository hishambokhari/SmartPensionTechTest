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
      expect(Catalog.new(file_path).file_pages).to be_a Array
    end
  end

end