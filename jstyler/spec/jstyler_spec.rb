require File.dirname(__FILE__) + '/spec_helper.rb'

include Jstyler

describe Jstyler, "when is being initialized" do
  
  it "should resolve formatter lib within javalibs folder" do
    FORMATTER_LIB.should include 'formatter'
  end
  
end
