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
        
        #prepare call
        execution_string = ''
        if result
          execution_string = flatten_sources srcs
          execution_string = flatten_options(options) + execution_string
          result = execution_string
        end
        
        result
      end
      
      def flatten_options(options = {})
        options_string = ''
        options.each {|key,val|
          val = File.expand_path val if key.to_s.include? 'config' 
          options_string += " -#{key}  #{val}"
        }
        
        options_string
      end
      
      def flatten_sources(srcs = [])
        src_string = ''
        srcs.uniq.flatten.each {|src| src_string += " " + File.expand_path(src)}
        
        src_string
      end
      
      def validate_source_directory srcs
        if !srcs.empty? && srcs.uniq.flatten.each { |item| return File.exist?(item) }
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
        if !File.exist? options.fetch(:config).to_s
          puts "Config path does not exist"
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