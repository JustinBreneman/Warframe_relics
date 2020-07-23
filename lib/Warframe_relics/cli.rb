class WarframeRelics::CLI
    def call
        puts "Welcome to the Warframe Relic scraping interface!"
        puts "Now retrieving Relic information"
        WarframeRelics::Relics.get_all_relics
        WarframeRelics::Relics.sort_relics
        puts "I can provide a list of relics: vaulted, available, or all."
        puts "I can also provide information on a specific relic."
        puts "What information would you like?"
        input = gets.chomp
    end
end