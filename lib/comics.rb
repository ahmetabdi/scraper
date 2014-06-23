require "comics/version"
require 'nokogiri'
require 'open-uri'

["scraper"].each do |inc|
  require File.join(File.dirname(__FILE__), "comics", inc)
end