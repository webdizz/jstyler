$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module Jstyler
  VERSION = '0.0.1'
  
  # The dependency path
  FORMATTER_LIB_PATH = File.dirname(__FILE__)+'/formatter-0.0.1.jar'
end