require 'zip'

module Music_parser_tool
  class Zipper
    class << self
      def create_archive
        entries = Dir.entries(Music_parser_tool.path) - %w[. ..]
        archive_path = Music_parser_tool.path_to_zip

        Zip::File.open(archive_path, Zip::File::CREATE) do |zipfile|
          entries.each do |entry|
            entry_path = File.join(Music_parser_tool.path, entry)
            zipfile.add(entry, entry_path) if File.file?(entry_path)
          end
        end

        archive_path
      end
    end
  end
end
