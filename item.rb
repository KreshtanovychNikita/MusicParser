module Music_parser_tool
  class Item
    attr_accessor :title, :link, :duration, :group

    include Comparable

    # Ініціалізація об'єкту Item з вказаними параметрами
    def initialize(title, link, duration, group)
      @title = title
      @link = link
      @duration = duration
      @group = group
    end

    # Виклик блоку для отримання додаткової інформації про елемент
    def info(&block)
      yield self if block_given?
    end

    # Форматує дані для виводу в текстовий файл
    def format_for_rile
      "#{@title}\t#{@link}\t#{@duration}\t#{@group}"
    end

    # Форматує дані для виводу в JSON або YAML формат
    def format_not_for_file
      {
        title: @title,
        link: @link,
        duration: @duration,
        group: @group
      }
    end

    # Реалізація методу порівняння для сортування за назвою
    def <=>(other)
      @title <=> other.title
    end
  end
end
