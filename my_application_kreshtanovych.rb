require 'singleton'
require 'pony'

module MusicParserTool
  class MyApplicationKreshtanovych
    include Singleton

    attr_accessor :web_address, :validator, :file_ext, :parse_item, :user

    def initialize
      # Set default values
      @web_address = "https://muzflix.net/sborniki/ukrainian-top-100"
      @validator = lambda { |min, max| min <= max }
      @file_ext = [".txt", ".json", ".csv",".yaml"]
      @parse_item = %i[title download_link listens group likes]
      @user = User.new
    end

    def configure
      yield(self) if block_given?
    end

    def to_config
      <<~CONFIG
        Web Address: #{@web_address}
        Validator: #{@validator}
        File Extensions: #{@file_ext}
        Parse Item Regex: #{@parse_item}
        User: #{user.to_s}
      CONFIG
    end
  end

  class User
    attr_accessor :email, :password

    def to_s
      "Email: #{@email}, Password: #{@password}"
    end
  end
end

MusicParserTool::MyApplicationKreshtanovych.instance.configure do |config|
  config.web_address = "https://muzflix.net/sborniki/ukrainian-top-100"
  config.validator = lambda { |min, max| min <= max }
  config.file_ext = [".txt", ".json", ".csv",".yaml"]
  config.parse_item = %i["title", "download_link", "listens", "group", "likes"]

  config.user.email = "krokodile408@gmail.com"
  config.user.password = "123456789_qQ"
end

puts MusicParserTool::MyApplicationKreshtanovych.instance.to_config
