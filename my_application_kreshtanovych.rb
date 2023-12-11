module Music_parser_tool
  class User
    attr_accessor :login, :password

    def initialize(login, password)
      @login = login
      @password = password
    end
  end

  class << self
    attr_accessor :web_address, :validator, :file_ext, :parse_item, :user

    def configure
      self.web_address = "https://meloua.com/popular"
      self.validator = lambda { |min, max| (min..max).cover?(10) } # Приклад валідатора
      self.file_ext = [".rb"]
      self.parse_item = /\d{2}-\d{2}-\d{4}/ # Приклад регулярного виразу
      self.user = User.new("krokodile408@gmail.com", "123456789_qQ") # Приклад об'єкта користувача
      yield(self)
    end
  end
end

# Налаштування додатку
Music_parser_tool.configure do |config|
  config.web_address = "https://meloua.com/popular"
  config.validator = lambda { |min, max| (min..max).cover?(10) } # Приклад валідатора
  config.file_ext = [".rb"]
  config.parse_item = /\d{2}-\d{2}-\d{4}/
  config.user = Music_parser_tool::User.new("krokodile408@gmail.com", "123456789_qQ") # Приклад об'єкта користувача
end
