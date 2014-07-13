require "scraper/version"
require 'nokogiri'
require 'open-uri'

["comics", "movies"].each do |inc|
  require File.join(File.dirname(__FILE__), "scraper", inc)
end