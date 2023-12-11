require 'thread'

module Music_parser_tool
  class Engine

    def run
      app = Music_parser_tool::MainApplication.new()
      app.run
      threads = []
      3.times do |i|
        threads << Thread.new { parse_page(Music_parser_tool.web_address) }
      end
      threads.each(&:join)

    end

  end
end

engine = Music_parser_tool::Engine.new()
engine.run