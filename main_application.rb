module Music_parser_tool
  class MainApplication

    def run
      cart = Cart.new
      items = Parser.parse_items()

      items.each do |item|
        cart.add_item(item)
        item.info do |item|
          puts "Song: '#{item.to_s}', exported"
        end
      end

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