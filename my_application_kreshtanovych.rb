module Music_parser_tool
    class << self
        attr_accessor :web_address, :file_ext, :numbers, :path, :path_to_zip

        # Конфігурація основних параметрів
        def configure
            return to_config unless block_given?
            yield self
        end

        # Конфігурація логіну
        def login(&block)
            @login ||= Login.new
            block.call(@login) if block_given?
            @login
        end

        # Форматує основні параметри для виводу
        def to_config
            str = "\nLogin to website configs:\n"
            str += "    Website: #{@web_address}\n"
            str += "    Path for data export: #{@path}"
            str += @login.to_config if @login
            str
        end
    end

    class Login
        attr_accessor :email, :password

        # Форматує дані логіну для виводу
        def to_config
            str = "\nCredits:\n"
            str += "    email: #{@email}\n"
            str += "    password: #{@password}\n\n"
        end
    end
end
