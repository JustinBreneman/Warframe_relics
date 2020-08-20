class WarframeRelics::Scraper
    def self.relic_info
        Nokogiri::HTML(open("https://warframe.fandom.com/wiki/Void_Relic/ByRelic")).css(".mw-content-text .article-table tr").map do |relic|
            if relic.css("td a").first != nil
                relic.css("td a").first.values
            end
        end.compact
    end

    def self.relic_drop_table(url)
        drop_table = []

        site = "https://warframe.fandom.com"
        relic_site = site << url

        counter = 0
        
        Nokogiri::HTML(open(relic_site)).css("#mw-content-text table#72656C6963table tr").each do |a|
            if counter == 6
                break
            else
                if a.css("td").first != nil && a.css("td").first.css("a").last != nil
                    b = a.css("td").first.css("a").last.text
                    drop_table << b
                    counter += 1
                end
            end
        end
        drop_table
    end

    def self.vaulted_relics
        Nokogiri::HTML(open("https://warframe.fandom.com/wiki/Void_Relic")).css("#mw-customcollapsible-VaultedRelicList tr td ul li span a").map do |relic| 
            relic.values
        end.compact
    end
end