require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative "./Warframe_relics/version"
require_relative "./Warframe_relics/cli"
require_relative "./Warframe_relics/relics"
require_relative "./Warframe_relics/scraper"


module WarframeRelics
  class Error < StandardError; end
  # Your code goes here...
end
