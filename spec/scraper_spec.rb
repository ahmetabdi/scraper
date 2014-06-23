require 'rspec'
require 'spec_helper'

describe Comics::Scraper do
  describe "Scraping the site" do
    before(:each) do
      @comics = Comics::Scraper.all
    end

    it "should return all comics" do
      puts @comics
    end

  end
end