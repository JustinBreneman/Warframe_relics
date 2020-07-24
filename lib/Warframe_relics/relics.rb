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

    def self.clear
        @@all_unsorted.clear
        @@vaulted.clear
        @@un_vaulted.clear
    end

    def self.all_unsorted
        @@all_unsorted.uniq
    end

    def self.all_sorted
        @@all_sorted.uniq
    end

    def self.vaulted
        @@vaulted.uniq
    end

    def self.un_vaulted
        @@un_vaulted.uniq
    end

    def self.get_all_relics
        WarframeRelics::Scraper.relic_info.each do |relic_array|
            relic = self.new(relic_array[1], relic_array[0])
            @@all_unsorted << relic
        end
    end

    def self.sort_relics
        vaulted_relic_names = []
        WarframeRelics::Scraper.vaulted_relics.each do |relic_array|
            vaulted_relic_names << relic_array[1]
        end
        @@all_unsorted.each do |relic|
            @@un_vaulted << relic
            vaulted_relic_names.each do |relic_name|
                if relic.name == relic_name
                    @@vaulted << relic
                end
            end
        end
        @@vaulted.each do |relic|
            @@un_vaulted.delete(relic)
        end
    end

    def self.find_by_name(name)
        self.all_unsorted.find{|relic| relic.name.downcase == name.downcase}
    end

    def self.get_drop_table(relic_name)
        relic = self.find_by_name(relic_name)
        drop_table = WarframeRelics::Scraper.relic_drop_table(relic.url)
        if @@vaulted.include? relic
            drop_table << "Vaulted"
        else
            drop_table << "Available"
        end
    end
end