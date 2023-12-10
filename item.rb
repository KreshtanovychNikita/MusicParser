module Music_parser_tool
  class Item
    attr_accessor :title, :link, :duration, :group

    include Comparable
  
    def initialize(title, link, duration, group)
      @title = title
      @link = link
      @duration = duration
      @group = group
    end
  
    def info(&block)
      yield self if block_given?
    end
  
    def to_s
      "#{@title} \t #{@link}  #{@duration} #{@group}"
    end
    
    def to_h
      {
        title: @title, 
        year: @link,
        duration: @duration,
        group: @group
      }
    end

  end
end
