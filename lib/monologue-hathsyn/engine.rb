require "coderay"
require "html/pipeline"

require "monologue-hathsyn/hathsyn_code_filter"

module MonologueHathsyn
  class Engine < ::Rails::Engine
    isolate_namespace MonologueHathsyn

    def self.activate
      files_to_req = Dir[File.join(File.dirname(__FILE__), "../../app/**/*_decorator.rb")]
      files_to_req.each do |c|
        Rails.env.production? ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
