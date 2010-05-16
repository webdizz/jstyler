# beautify.rb

require 'buildr'

module Jstyler
  
  module Beautify
    
    include Extension
    
    class Beautify
      
      include Jstyler
      
      #  :call-seq:
      #   run = config_file, src/ src2
      #   run = hash, src (hash - {:config=>config_file, :verbose=>true })
      def run(options, *srcs)
        options = { :config=>options } unless Hash === options
        
        #validation
        result = validate_config_path options
        result = validate_source_directory srcs if result
        
        result
      end
      
      def validate_source_directory srcs
        if !srcs.empty? && srcs.uniq.flatten.each { |item| item != nil && File.exist?(item) }
          puts "Source(s) directory(ies) cannot be accessed"
          return false
        end
        return true
      end
      private :validate_source_directory
      
      def validate_config_path options
        #validation
        if !options.has_key?(:config)
          puts "Config path need to be defined"
          return false
        end
        return true
      end
      private :validate_config_path
      
    end
    
    # task not specific to any projet
    first_time do
      
    end
    
    before_define do |project|
      
    end
    
    after_define do |project|
    end
    
    
  end  
  
end

class Buildr::Project
  include Jstyler::Beautify
end