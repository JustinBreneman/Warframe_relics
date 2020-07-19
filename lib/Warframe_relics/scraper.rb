class WarframeRelics::Scraper
    def relic_info
        relic_info = []
        
        Nokogiri::HTML(open("https://warframe.fandom.com/wiki/Void_Relic/ByRelic")).css(".mw-content-text .article-table tr").each do |relic|
            if relic.css("td a").first != nil
                relic_info << relic.css("td a").first.values
            end
        end
        relic_info
    end

    def relic_drop_table(url)
        drop_table = []

        counter = 0
        
        Nokogiri::HTML(open(url)).css("#mw-content-text table#72656C6963table tr").each do |a|
            if counter == 6
                exit
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

    def vault_status(url)
        vault_status = Nokogiri::HTML(open(url)).css("#mw-content-text").first.css("aside section div div div").first.text
    end
end