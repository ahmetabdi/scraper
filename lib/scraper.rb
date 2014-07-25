require "scraper/version"
require 'nokogiri'
require 'open-uri'
require 'ostruct'

["comics", "movies"].each do |inc|
  require File.join(File.dirname(__FILE__), "scraper", inc)
end