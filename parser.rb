module Music_parser_tool
  class Parser 

    def self.parse_items()
      items = [] 

      doc = Nokogiri::HTML(Faraday.get(Music_parser_tool.web_address).body)
      rows = doc.css("div.items div.item")

      rows.each_with_index do |row, index| 
        break if index == Music_parser_tool.numbers

        title_with_group = row.css("div.cover").attribute("data-name").value.strip
        link = row.css("div.cover").attribute("data-stream").value
        duration = row.css("div.duration.hidden").text.strip
        match = title_with_group.match(/^(.*?)(?: - | — | – | — | -|–|—)(.*)$/)
        group = match[1].strip if match
        title = match[2].strip if match
        item = Item.new(title, link, duration,group)
        items << item 
      end 
      items 
    end
  end
end

