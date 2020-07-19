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
        WarframeRelics::Scraper.relic_info.each do |relic_array|
            name = relic_array[1]
            url = relic_array[0]
            relic = self.new(name, url)
            @@all_unsorted << relic
        end
    end

    def self.sort_relics
        vaulted_relic_names = []
        WarframeRelics::Scraper.vaulted_relics.each do |relic_array|
            vaulted_relic_names << relic_array[1]
        end
        @@all_unsorted.each do |relic|
            vaulted_relic_names.each do |relic_name|
                if relic.name == relic_name
                    @@vaulted << relic
                else
                    @@un_vaulted << rellic
                end
            end
        end
    end
end