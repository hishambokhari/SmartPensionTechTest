require "catalog"

describe Catalog do
  let(:file_path) {"spec/webserver.log"} # where the web server file is located

  describe "#initialize" do
    it "takes the log file as an argument" do
      expect(Catalog.instance_method(:initialize).arity).to eq(1) # .arity returns an indication od arguments accepted by a method. In this case its only 1 - the (file path)
    end
  end
end