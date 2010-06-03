require File.dirname(__FILE__) + '/spec_helper.rb'

include Jstyler
include Jstyler::Beautify
include Buildr

describe BeautifyRunner, "when is being ran" do
  
  before do
    @beautify = BeautifyRunner.new
    @config = File.expand_path GEM_DIRECTORY+'/conventions/java.prefs'
    @src = File.expand_path File.dirname(__FILE__)+'/fixture'
  end
  
  it "should error if src argument is not defined" do
    @beautify.run({}, nil).should be_false
    @beautify.run({}, '').should be_false
  end
  
  it "should use built-in default config if it and convention attributes were not defined" do
    res = @beautify.run({}, @src)
    res.should be_true
    res.should include '-config'
  end
  
  it "should not pass -convention attribute to java" do
    res = @beautify.run({:convention=>:Java}, @src)
    res.should be_true
    res.should include '-config'
    res.should_not include '-convention'
  end
  
  it "should fail if -convention attribute does not exist" do
    res = @beautify.run({:convention=>:Java_custom}, @src)
    res.should be_false
  end
  
  it "should error if config does not exist" do
    res = @beautify.run({:verbose=>'', :config=>@config+'_'}, @src)
    res.should be_false
  end
  
  it "should error if src directory is does not exist" do
    @beautify.run({:config=>"somepath"}, 'nilsrc').should be_false
    @beautify.run({:config=>"somepath"}, 'nilsrc', 'sbfdgb').should be_false
  end
  
  it "should error if there is no JAVA_HOME environment var" do
    previous = ENV['JAVA_HOME']
    ENV.delete('JAVA_HOME')
    @beautify.run({:config=>@config}, @src).should be_false
    ENV['JAVA_HOME'] = previous
  end
  
  it "should have flatten to string source arguments" do
    res = @beautify.run({:config=>@config}, @src, @src)
    res.should_not be_false
    res.should include @src
  end
  
  it "should contain prepared command line attributes as a string" do
    res = @beautify.run({:config=>@config, :verbose=>''}, @src)
    res.should be_true
    res.should include "-config"
    res.should include @config
    res.should include "-verbose"
  end
  
  it "should prevent passing not supported configuration options" do
    res = @beautify.run({:config=>@config, :verbose=>'true', :someother_property=>'someother_property', :some=>''}, @src)
    res.should be_true
    res.should_not include '-someother_property'
    res.should_not include '-some'
    res.should include 'config'
    res.should include 'verbose'
  end
  
end