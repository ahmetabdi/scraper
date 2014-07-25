require 'rspec'
require 'spec_helper'

describe Scraper::Comics do
  describe "Scraping the site" do
    before(:each) do
      @comics = Scraper::Comics.all(1,1)
    end

    it "should return 15 comics for first page" do
      expect(@comics.count).to eq(15)
    end
  end

  describe "Scraping a comic" do
    before(:all) do
      @comic = Scraper::Comics.all(1,1).first
    end

    it "should always return a title" do
      puts @comic.title
      expect(@comic.title).not_to be_empty
    end

    it "should always return a url" do
      puts @comic.url
      expect(@comic.url).not_to be_empty
    end

    it "should always return a main_image" do
      puts @comic.main_image
      expect(@comic.main_image).not_to be_empty
    end

    it "should always return a download_link" do
      puts @comic.download_link
      expect(@comic.download_link).not_to be_empty
    end
  end

end