require File.dirname(__FILE__) + '/spec_helper.rb'

include Jstyler
include Jstyler::Beautify
include Buildr

describe Beautify, "when is being ran" do
  
  before do
    @beautify = Beautify.new
  end
  
  it "should error if src argument is not defined" do
    @beautify.run({}, nil).should be_false
    @beautify.run({}, '').should be_false
  end
  
  it "should error if config was not defined" do
    @beautify.run({}, "src").should be_false
    @beautify.run({:verbose=>"true"}, "src").should be_false
  end
  
  it "should error if src directory is does not exist" do
    @beautify.run({:config=>"somepath"}, 'nilsrc').should be_false
    @beautify.run({:config=>"somepath"}, 'nilsrc', 'sbfdgb').should be_false
  end
  
end