require File.dirname(__FILE__) + '/spec_helper.rb'

include Jstyler

describe Jstyler, "when is being initialized" do
  
  before do
  	FileUtils.touch JAVA_LIBS+'/some-test-formatter.jar'
  end
  
  it "should resolve formatter lib within javalibs folder" do
    Jstyler.FORMATTER_LIB.should include 'formatter'
  end
  
end
