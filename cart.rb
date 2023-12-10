module Music_parser_tool
  class Cart
    include ItemContainer
    include Enumerable

    def initialize
      @items = []
    end

    def export_to_file()
      File.open("#{Music_parser_tool.path}/data.txt", "w") do |file|
        file.puts "Top 30 Ukrainian songs!:"
        file.puts "\n"
        @items.each do |item|
          file.puts item.to_s
        end
        file.puts "\n"
        file.puts "QTY: #{total_items}"
      end
    end

    def export_to_json()
      File.open("#{Music_parser_tool.path}/data.json", "w") do |file|
        file.puts JSON.pretty_generate(to_h)
      end
    end

    def export_to_csv()
      CSV.open("#{Music_parser_tool.path}/data.csv", "w") do |csv|
        csv << ["Top 30 Ukrainian Songs!:""\n\n","Title", "Link", "Duration", "Group"]
        @items.each do |item|
          csv << item.to_h.values
        end
      end
    end

    def export_to_yaml()
      File.open("#{Music_parser_tool.path}/data.yaml", "w") do |file|
        file.puts("Top 30 Ukrainian Songs!:")
        file.puts YAML.dump(to_h)
      end
    end

  end
end