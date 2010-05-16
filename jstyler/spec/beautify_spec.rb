require File.dirname(__FILE__) + '/spec_helper.rb'

include Jstyler
include Jstyler::Beautify
include Buildr

describe BeautifyRunner, "when is being ran" do
  
  before do
    @beautify = BeautifyRunner.new
    @config = File.expand_path $JAVA_LIBS+'/org.eclipse.jdt.core.prefs'
    @src = File.expand_path File.dirname(__FILE__)+'/fixture'
  end
  
  it "should error if src argument is not defined" do
    @beautify.run({}, nil).should be_false
    @beautify.run({}, '').should be_false
  end
  
  it "should error if config was not defined" do
    @beautify.run({}, "src").should be_false
    @beautify.run({:verbose=>''}, "src").should be_false
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
    @beautify.run({:config=>"somepath"}, 'fixture', 'sss').should be_false
    @beautify.run({:config=>@config}, @src).should be_true
    @beautify.run({:config=>@config}, @src, @src).should include @src
  end
  
  it "should contain prepared command line attributes as a string" do
    res = @beautify.run({:config=>@config, :verbose=>''}, @src)
    res.should be_true
    res.should include "-config"
    res.should include @config
    res.should include "-verbose"
  end
  
end