module Music_parser_tool
  class Parser
    def self.parse_items
      items = []

      # Отримання HTML-сторінки від веб-сайту за допомогою Faraday
      doc = Nokogiri::HTML(Faraday.get("#{Music_parser_tool.web_address}").body)

      # Вибір всіх рядків з елементами
      rows = doc.css("div.track-itemss.js-item")

      # Ітерація через кожен рядок
      rows.each do |row|
        # Отримання необхідних даних з рядка
        group = row.css("div.track-title").text.strip
        title = row.css("div.song").text.strip
        listens = row.css("i.fa-listen").attr("title").to_s.to_i
        likes = row.css("i.fa-heart").attr("title").to_s.to_i
        download_link = row.css("a.track-fav").attr("href").value

        # Створення об'єкту Item та додавання його до масиву
        item = Item.new(title, download_link, listens, group, likes)
        items << item
      end

      # Повернення масиву елементів
      items
    end
  end
end
