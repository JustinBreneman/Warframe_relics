class WarframeRelics::CLI
    def call
        puts "Welcome to the Warframe Relic scraping interface!"
        puts "Now retrieving Relic information"
        WarframeRelics::Relics.get_all_relics
        WarframeRelics::Relics.sort_relics
        input = " "
        until input == 'exit'
            puts "I can provide a list of relics: vaulted, available, or all."
            puts "I can also provide information on a specific relic."
            puts "Type exit at any time to leave."
            puts "What information would you like?"
            input = gets.chomp
            if input.downcase == 'vaulted'
                WarframeRelics::Relics.vaulted.each {|relic| puts "#{relic.name}"}
            elsif input.downcase == 'available'
                WarframeRelics::Relics.un_vaulted.each {|relic| puts "#{relic.name}"}
            elsif input.downcase == 'all'
                puts "Vaulted:"
                WarframeRelics::Relics.vaulted.each {|relic| puts "#{relic.name}"}
                puts "Available:"
                WarframeRelics::Relics.un_vaulted.each {|relic| puts "#{relic.name}"}
            elsif input.downcase == 'exit'
                puts "Goodbye."
                WarframeRelics::Relics.clear
            else
                WarframeRelics::Relics.get_drop_table(input).each {|item| puts "#{item}"}
            end
        end
    end
end