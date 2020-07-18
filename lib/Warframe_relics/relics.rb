class WarframeRelics::Relics
    attr_accessor :name, :url
    @@all = []
    def initialize(name, url)
        @name = name
        @url = url
    end
end