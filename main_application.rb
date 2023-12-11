module Music_parser_tool
  class MainApplication

    # Метод запуску головної програми
    def run
      # Створення об'єкту корзини для збереження елементів
      cart = Cart.new

      # Парсинг елементів з вказаного веб-сайту
      items = Parser.parse_items()

      # Додавання кожного елементу до списку та вивід інформації про експорт
      items.each do |item|
        cart.add_item(item)
        item.info do |item|
          puts "Song: '#{item.format_for_rile}', exported"
        end
      end

      # Здійснення експорту відповідно до вказаних форматів
      Music_parser_tool.file_ext.each do |element|
        case element
        when ".txt"
          cart.export_to_file()
        when ".csv"
          cart.export_to_csv()
        when ".json"
          cart.export_to_json()
        when ".yaml"
          cart.export_to_yaml()
        else
          puts "Export Error"
        end
      end
    end

  end
end
