module Music_parser_tool
  class Parser
    def self.parse_items
      items = []
      current_page = 1

      loop do
        # Отримання HTML-сторінки від веб-сайту за допомогою Faraday
        doc = Nokogiri::HTML(Faraday.get("#{Music_parser_tool.web_address}#{current_page > 1 ? '?page=' + current_page.to_s : ''}").body)

        # Вибір всіх рядків з елементами
        rows = doc.css("div.items div.item")

        # Ітерація через кожен рядок та обмеження кількістю елементів
        rows.each_with_index do |row, index|
          break if items.size >= Music_parser_tool.numbers

          # Отримання необхідних даних з рядка
          title_with_group = row.css("div.cover").attribute("data-name").value.strip
          link = row.css("div.cover").attribute("data-stream").value
          duration = row.css("div.duration.hidden").text.strip

          # Розбиття title_with_group на групу та заголовок
          match = title_with_group.match(/^(.*?)(?: - | — | – | — | -|–|—)(.*)$/)
          group = match[1].strip if match
          title = match[2].strip if match

          # Створення об'єкту Item та додавання його до масиву
          item = Item.new(title, link, duration, group)
          items << item
        end

        break if items.size >= Music_parser_tool.numbers || no_more_pages?(doc)
        current_page += 1
      end

      # Повернення масиву елементів
      items
    end

    def self.no_more_pages?(doc)
      # Перевірка, чи є атрибут href для наступної сторінки
      next_page_link = doc.at_css(".next-page")
      next_page_link.nil? || next_page_link["href"].nil?
    end
  end
end
