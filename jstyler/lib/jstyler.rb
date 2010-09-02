$:.unshift(File.dirname(__FILE__)) unless
$:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module Jstyler
  VERSION = '0.0.5'
  
  # current gem directory
  GEM_DIRECTORY = File.expand_path(File.dirname(__FILE__)+'/../')
  
  # path to java libs   
  JAVA_LIBS = File.expand_path(File.dirname(__FILE__)+'/../javalibs')
  
  # resolve formatter lib from available libs 
  FORMATTER_LIB = Dir.glob(JAVA_LIBS+'/*.jar').select{|item|item.include?('formatter')}.first
  
end

require 'jstyler/beautify'
require 'jstyler/settings'