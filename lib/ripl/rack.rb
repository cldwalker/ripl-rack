require 'ripl'
require 'rack'
require 'rack/test'

module Ripl::Rack
  def before_loop
    Commands.rack
    puts "Loading #{Commands.rack.env} environment (Rack #{Rack.version})"
    super
  end

  module Commands
    def self.rack
      @rack ||= Ripl::Rack::App.new
    end

    def rack
      Commands.rack
    end

    def rackit!
      Ripl::Rack::Commands.module_eval do
        rack.actions.each do |meth|
          define_method(meth) {|*args| rack.send(meth, *args) }
        end
      end
    end
  end

  class App
    include Rack::Test::Methods
    attr_reader :app, :env

    def initialize(config_ru=nil)
      config_ru ||= ENV['RACK_CONFIG'] || 'config.ru'
      unless File.exists? config_ru
        abort "Rack config file '#{config_ru}' doesn't exist. Specify with ENV['RACK_CONFIG']"
      end
      @app = Kernel.eval("Rack::Builder.new { #{File.read(config_ru)} }")
      @env = ENV['RACK_ENV'] || 'development'
    end

    def actions
      ::Rack::Test::Methods::METHODS
    end
  end
end

Ripl::Shell.send :include, Ripl::Rack
Ripl::Commands.send :include, Ripl::Rack::Commands
