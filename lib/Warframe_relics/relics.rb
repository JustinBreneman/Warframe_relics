class WarframeRelics::Relics
    
    attr_accessor :name, :url, :drop_table, :vault_status
    
    @@all_unsorted = []
    @@vaulted = []
    @@un_vaulted = []
    @@all_sorted = [@@vaulted, @@un_vaulted]
    
    def initialize(name, url)
        @name = name
        @url = url
    end

    def all_unsorted
        @@all_unsorted
    end

    def all_sorted
        @@all_unsorted
    end

    def vaulted
        @@vaulted
    end

    def un_vaulted
        @@un_vaulted
    end

    def self.get_all_relics
        relic_info = WarframeRelics::Scraper.new.relic_info
        relic_info.each do |relic_array|
            name = relic_array[1]
            url = relic_array[0]
            relic = self.new(name, url)
            @@all_unsorted << relic
        end
    end
end