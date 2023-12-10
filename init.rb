Music_parser_tool.configure do |music_parser_tool|
    music_parser_tool.web_address = "https://meloua.com/popular"
    music_parser_tool.numbers = 50
    music_parser_tool.path = "#{__dir__}/export_data_files"
    music_parser_tool.file_ext = [".txt", ".json", ".csv",".yaml"]


    music_parser_tool.login do |login|
        login.email = "krokodile408@gmail.com"
        login.password = "123456789_qQ"
    end
    puts music_parser_tool.to_config
end
