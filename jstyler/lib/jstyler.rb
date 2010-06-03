$:.unshift(File.dirname(__FILE__)) unless
$:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module Jstyler
  VERSION = '0.0.4'
  
  GEM_DIRECTORY = File.expand_path(File.dirname(__FILE__)+'/../')
  
  FORMATTER_LIB = 'formatter-0.0.2.jar'
  
  JAVA_LIBS = File.expand_path(File.dirname(__FILE__)+'/../javalibs')
  
end

require 'jstyler/beautify'
require 'jstyler/settings'