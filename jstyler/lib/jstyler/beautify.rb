# beautify.rb

require 'buildr'
require 'session'

include Jstyler

module Jstyler
  
  module Beautify
    
    include Extension
    
    class BeautifyRunner
      
      def initialize
        @conventions = ['java', 'eclipse']
        @allowed_options = ['config', 'convention', 'verbose']
      end
      
      #  :call-seq:
      #   run = config_file, src/ src2
      #   run = hash, src (hash - {:config=>config_file, :verbose=>true })
      def run(config_options, *srcs)
        @options = { :config=>config_options } unless Hash === config_options
        @options = config_options if @options == nil
        current_dir = Dir.pwd
        
        #validation
        result = validate_config_path @options
        result = validate_source_directory srcs if result
        result = validate_env if result
        
        #prepare call
        execution_string = ''
        if result
          execution_string = flatten_sources srcs
          execution_string = flatten_options(@options) + execution_string
          
          Dir.chdir(JAVA_LIBS)
          java = File.expand_path ENV['JAVA_HOME']+'/bin/java'
          cmd = "#{java} -jar #{Jstyler.FORMATTER_LIB} #{execution_string} "
          shell = Session::Shell.new
          stdout, stderr = shell.execute cmd
          status = shell.status 
          puts stdout
          puts stderr if !status
          
          #change directory to previous one
          Dir.chdir(current_dir)
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
      
      def validate_env
        if !ENV.has_key?('JAVA_HOME')
          puts "There is no JAVA_HOME in your environment"
          return false
        end
        return true
      end
      private :validate_env
      
      def validate_source_directory sources
        if ! sources.empty? && sources.uniq.flatten.each { |item| return ! item.nil? && File.exist?(item) }
          puts "Source(s) directory(ies) cannot be accessed"
          return false
        end
        return true
      end
      private :validate_source_directory
      
      def validate_config_path config_options
        #validation
        # use default convention (Java)
        if ! config_options.has_key?(:config) && ! config_options.has_key?(:convention) 
          puts "Config path and convention were not defined, will use Java convention."
          @options[:config] = File.expand_path GEM_DIRECTORY+'/conventions/java.prefs'
        end
        # use specified built-in convention
        if ! config_options.has_key?(:config) && config_options.has_key?(:convention)
          convention = "#{config_options.fetch(:convention)}".downcase
          puts "Convention '#{convention}' was defined."
          @options[:config] = ''
          @options[:config] = File.expand_path(GEM_DIRECTORY+"/conventions/#{convention}.prefs") if @conventions.include?(convention)
          @options.delete :convention
        end
        if !File.exist? @options.fetch(:config).to_s
          puts "Config path does not exist"
          return false
        end
        options_to_check = [].concat @options.keys
        options_to_check.each{|key|
          @options.delete key if !(@allowed_options.include? key.to_s)
          @options[key] = '' if key.to_s == 'verbose' #verbose value should be empty
        }
        return true
      end
      private :validate_config_path
      
    end
    
    # task not specific to any project
    first_time do
      Project.local_task('format') 
    end
    
    before_define do |project|
      
    end
    
    after_define do |project|
      
      task 'format' do |task|
        puts "Perform formatting...."
        runner = BeautifyRunner.new
        sources_to_format = [].concat project.compile.sources
        sources_to_format.concat project.test.compile.sources if ! project.test.compile.sources.empty?
        runner.run(project.jstyler.options, sources_to_format.flatten)
      end
    end
    
  end  
  
end

#inject beautifier into buildr project
class Buildr::Project
  include Jstyler::Beautify  
end
