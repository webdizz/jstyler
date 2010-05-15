# formatter.rb

module Jstyler
  
  class Formatter
    
    include Jstyler
    include Buildr
    
    def formatter_artifact
      @artifact = artifact('name.webdizz.jstyler:formatter:jar:0.0.1').from(FORMATTER_LIB_PATH)
      @artifact.invoke 
      @artifact
    end
    
  end
  
end