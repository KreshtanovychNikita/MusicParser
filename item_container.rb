module ItemContainer
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  include Enumerable

  # Метод для ітерації через всі елементи контейнера
  def each
    return unless block_given?
    items.each do |item|
      yield item
    end
  end

  module ClassMethods
  end

  module InstanceMethods
    # Метод для додавання елементу до контейнера
    def add_item(item)
      @items << item
    end

    # Виведення інформації про підключення для кожного елементу
    def connection_info
      @items.each do |item|
        puts item.connection_info
      end
    end

    # Підрахунок загальної кількості елементів в контейнері
    def total_items
      @items.size
    end

    # Форматування даних для виводу в JSON ,YAML,CSV формат
    def format_not_for_file
      {
        items: @items.map(&:format_not_for_file),
        QTY: total_items,
      }
    end
  end
end
