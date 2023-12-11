module Music_parser_tool
  class Item
    attr_accessor :title, :download_link, :listens, :group, :likes

    include Comparable

    # Ініціалізація об'єкту Item з вказаними параметрами
    def initialize(title, download_link, listens, group, likes)
      @title = title
      @download_link = download_link
      @listens = listens
      @group = group
      @likes = likes
    end

    # Виклик блоку для отримання додаткової інформації про елемент
    def info(&block)
      yield self if block_given?
    end

    # Форматує дані для виводу в текстовий файл
    def format_for_rile
      "#{@title}\t#{@download_link}\t#{@listens}\t#{@group}\t#{@likes}"
    end

    # Форматує дані для виводу в JSON або YAML формат
    def format_not_for_file
      {
        title: @title,
        link: @download_link,
        duration: @listens,
        group: @group,
        likes: @likes
      }
    end

    # Реалізація методу порівняння для сортування за назвою
    def <=>(other)
      @title <=> other.title
    end
  end
end
