module Music_parser_tool

    class << self
        attr_accessor :web_address, :file_ext, :login, :numbers, :path, :path_to_zip

        def config
            return to_s unless block_given?
            if @Music_parser_tool
                puts "\nError\n"
                return
            end
            yield self
            @Music_parser_tool ||= self
        end

        def login(&block)
            @login ||= Login.config(&block)
        end

        private

        def to_s
            str = "\nLogin to website configs:\n"
            str += "    Website: #{@web_address}\n"
            str += "    Path for data export: #{@path}"
            str += @login.config if @login
            str
        end

    end

    class Login
        class << self
            attr_accessor :email, :password

            def config(&block)
                return to_s unless block_given?

                return @login if @login

                yield self
                @login ||= self
                @login.freeze
            end

            private

            def to_s
                str = "\nCredits:\n"
                str += "    email: #{@email}\n"
                str += "    password: #{@password}\n\n"
            end

        end
    end

end