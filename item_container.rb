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

    def remove_item(item)
      @items.delete(item)
    end

    def delete_items
      @items.clear
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

    def method_missing(method_name, *arguments, &block)
      if method_name.to_s.start_with?('show_all_items_by_')
        attribute = method_name.to_s[18..-1]
        define_show_all_items_by(attribute)
        send(method_name, *arguments, &block)
      else
        super
      end
    end

    private

    def define_show_all_items_by(attribute)
      self.class.class_eval do
        define_method(attribute) do
          puts "Showing all items by title:"
          puts @items.map { |item| item.title }.join("\n")
        end
      end
    end
  end
end
