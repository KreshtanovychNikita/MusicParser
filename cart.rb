module Music_parser_tool
  class Cart
    include ItemContainer
    include Enumerable

    def initialize
      @items = []
    end

    # Експортує дані  у текстовий файл
    def export_to_file
      write_to_file("#{Music_parser_tool.path}/data.txt") do |file|
        file.puts "Top 30 Ukrainian songs!: \n\n"
        @items.each { |item| file.puts item.format_for_rile }
        file.puts "\nQTY: #{total_items}"
      end
    end

    # Експортує дані  у формат JSON
    def export_to_json
      write_to_file("#{Music_parser_tool.path}/data.json") do |file|
        file.puts JSON.pretty_generate(format_not_for_file)
      end
    end

    # Експортує дані  у формат CSV
    def export_to_csv
      write_to_file("#{Music_parser_tool.path}/data.csv") do |csv|
        csv.puts ["Top 30 Ukrainian Songs!: \n\n"]
        @items.each do |item|
          csv.puts item.format_not_for_file
        end
      end
    end

    # Експортує дані  у формат YAML
    def export_to_yaml
      write_to_file("#{Music_parser_tool.path}/data.yaml") do |file|
        file.puts "Top 30 Ukrainian Songs!: \n"
        file.puts YAML.dump(format_not_for_file)
      end
    end

    private

    # Записує вказані дані у файл за вказаним шляхом
    def write_to_file(file_path)
      File.open(file_path, "w") { |file| yield file }
    end
  end
end
