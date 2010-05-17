# settings.rb

module Jstyler
  
  class Settings
    
    include Singleton
    include Buildr
    
    # :call-seq:
    #   jstyler => Hash
    #
    # Returns an hash of all settings attributes for Jstyler.
    #
    # Within application build file you can specify settings for Jstyler in following way:
    #   jstyler.options = {:config=>'path_to_config'}
    #
    # You can also specify configuration options in the build.yaml (within project source directory)
    # or in the .buildr/settings.yaml in your HOME directory.
    #
    # For example:
    # jstyler:
    #   options:
    #     config: path_to_config
    #     verbose: true
    def options
      unless @options_holder
        @options_holder = Hash.new(Buildr.settings.build).merge({}) { |repos, hash|
          repos | Hash.new(hash['jstyler'] && hash['jstyler']['options'])
        }
      end
      
      @options_holder
    end    
    
  end
  
end

module Buildr
  
  def jstyler
    return Jstyler::Settings.instance
  end
  
end