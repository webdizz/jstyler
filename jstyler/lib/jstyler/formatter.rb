# formatter.rb
require 'buildr'
require 'buildr/packaging/artifact'
require 'buildr/packaging/ziptask'
require 'fileutils'

module Jstyler
  
  class Formatter
    
    include Jstyler
    include Buildr
    
    def formatter_artifact
      @artifact = artifact('name.webdizz.jstyler:formatter:jar:0.0.1').from(FORMATTER_LIB_PATH)
      @artifact.invoke if ! File.exist? @artifact.to_s
      @artifact
    end
    
    def extract
      artifact = formatter_artifact
      result = false
      if File.exists? artifact.to_s
        zip_file = expand_path artifact.to_s
        target_dir = expand_path GEM_DIRECTORY+'/javalibs'
        
        # extract libs from jar under lib directory
        Zip::ZipFile.open(zip_file.to_s) do |zip|
          zip.each { |f|
            if f.name.include? "lib/" or f.name.include? ".core.prefs"
              f_path=File.join(target_dir, f.name)
              FileUtils.mkdir_p(File.dirname(f_path))
              zip.extract(f, f_path) unless File.exist?(f_path)
            end
          }
        end
        FileUtils.cp zip_file, target_dir
        result = true
      end
      result
    end
    
    private
    
    def expand_path(path_to_expand)
      File.expand_path path_to_expand
    end
    
  end
end