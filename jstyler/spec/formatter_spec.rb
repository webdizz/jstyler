require File.dirname(__FILE__) + '/spec_helper.rb'

include Jstyler
include Buildr

describe Formatter, "when first created" do
  
  before do
    @formatter= Formatter.new
  end
  
  it "should have formatter jar file as an artifact" do
    @formatter.formatter_artifact.should_not be_nil
    @formatter.formatter_artifact.should be_instance_of Artifact
  end
  
end