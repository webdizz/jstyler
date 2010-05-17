# beautify.rb

require 'buildr'
require 'session'

module Jstyler
  
  module Beautify
    
    include Extension
    
    class BeautifyRunner
      
      include Jstyler
      
      #  :call-seq:
      #   run = config_file, src/ src2
      #   run = hash, src (hash - {:config=>config_file, :verbose=>true })
      def run(options, *srcs)
        options = { :config=>options } unless Hash === options
        current_dir = Dir.pwd
        
        #validation
        result = validate_config_path options
        result = validate_source_directory srcs if result
        result = validate_env if result
        
        #prepare call
        execution_string = ''
        if result
          execution_string = flatten_sources srcs
          execution_string = flatten_options(options) + execution_string
          # change directory to run command
          Dir.mkdir $JAVA_LIBS if ! File.exist? $JAVA_LIBS
          fromatter = Formatter.new
          fromatter.extract if File.exist? $JAVA_LIBS
          
          Dir.chdir($JAVA_LIBS)
          java = File.expand_path ENV['JAVA_HOME']+'/bin/java'
          cmd = "#{java} -jar #{FORMATTER_LIB} #{execution_string} "
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
    
    # task not specific to any project
    first_time do
      Project.local_task('format') 
    end
    
    before_define do |project|
      task 'format' do |task|
        puts "Perform formatting...."
        $JAVA_LIBS = File.expand_path project.target
        runner = BeautifyRunner.new
        config = File.expand_path 'jstyler.prefs'
        puts "Save eclipse preferences within project directory with name 'jstyler.prefs'" if ! File.exist? config
        puts "Define project.jstyler property for your project as {:config=>path_to_config,:verbose=>''}" if project.jstyler.nil?
        runner.run({:config=>'jstyler.prefs'}, project.compile.sources)
      end
    end
    
    after_define do |project|
    end
    
    
  end  
  
end

#inject beautifier into buildr project
class Buildr::Project
  include Jstyler::Beautify  
end
