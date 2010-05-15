require File.dirname(__FILE__) + '/spec_helper.rb'

include Jstyler
include Buildr

describe Formatter, "when first created" do
  
  before do
    @formatter= Formatter.new
  end
  
  it "should have installed formatter artifact" do
    @formatter.formatter_artifact.should_not be_nil
    @formatter.formatter_artifact.should be_instance_of Artifact
  end
  
  it "should extract .jars from artifact" do
    @formatter.formatter_artifact.should_not be_nil
    @formatter.extract.should_not be_false
    target_dir = File.expand_path GEM_DIRECTORY+'/javalibs'
    Dir.entries(target_dir).size.should have_at_least(4).items
  end
  
end