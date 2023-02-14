class StringBuilder
    def initialize
        @str = ""
    end

    def add(str)
        @str += str
    end

    def output
        return @str
    end
end
