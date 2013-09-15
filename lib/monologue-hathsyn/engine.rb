require "coderay"
require "html/pipeline"

require "monologue-hathsyn/hathsyn_code_filter"

module MonologueHathsyn
  class Engine < ::Rails::Engine
    isolate_namespace MonologueHathsyn

    def self.activate
      puts "ACTIVATING"
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
