class WarframeRelics::Relics
    
    attr_accessor :name, :url
    
    @@all_unsorted = []
    @@vaulted = []
    @@un-vaulted = []
    @@all_sorted = [@@vaulted, @@un-vaulted]
    
    def initialize(name, url)
        @name = name
        @url = url
    end
end