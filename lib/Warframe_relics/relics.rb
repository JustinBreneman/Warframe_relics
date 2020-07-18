class WarframeRelics::Relics
    attr_accessor :name, :url
    @@vaulted = []
    @@un-vaulted = []
    @@all = [@@vaulted, @@un-vaulted]
    def initialize(name, url)
        @name = name
        @url = url
    end
end