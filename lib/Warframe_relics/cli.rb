class WarframeRelics::CLI
    def call
        puts "Welcome to the Warframe Relic scraping interface!"
        puts "Now retrieving Relic information"
        WarframeRelics::Relics.get_all_relics
        WarframeRelics::Relics.sort_relics
        input = " "
        until input == 'exit'
            puts " "
            puts "I can provide a list of relics: vaulted, available, or all."
            puts "I can also provide information on a specific relic."
            puts "Type exit at any time to leave."
            puts "What information would you like?"
            input = gets.chomp
            puts " "
            if input.downcase == 'vaulted'
                puts "---"
                WarframeRelics::Relics.vaulted.each {|relic| puts "#{relic.name}"}
                puts "---"
            elsif input.downcase == 'available'
                puts "---"
                WarframeRelics::Relics.un_vaulted.each {|relic| puts "#{relic.name}"}
                puts "---"
            elsif input.downcase == 'all'
                puts "---"
                puts "Vaulted:"
                puts " "
                WarframeRelics::Relics.vaulted.each {|relic| puts "#{relic.name}"}
                puts " "
                puts "Available:"
                puts " "
                WarframeRelics::Relics.un_vaulted.each {|relic| puts "#{relic.name}"}
                puts "---"
            elsif input.downcase == 'exit'
                puts "Goodbye."
                WarframeRelics::Relics.clear
            else
                puts "---"
                WarframeRelics::Relics.get_drop_table(input).each {|item| puts "#{item}"}
                puts "---"
            end
        end
    end
end