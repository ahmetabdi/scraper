require 'rspec'
require 'spec_helper'

describe Scraper::Movies do

  describe "Scraping the site" do
    before(:each) do
      @movies = Scraper::Movies.all(1,1)
    end

    it "should return all 10 movies for first page" do
      expect(@movies.count).to eq(10)
    end
  end

  describe "Scraping a movie" do
    before(:all) do
      @movie = Scraper::Movies.all(1,1).first
    end

    it "should always return a type" do
      expect(@movie[:type]).to be(:movie)
    end

    it "should always return a title" do
      expect(@movie[:title]).not_to be_empty
    end

    it "should always return a url" do
      expect(@movie[:url]).not_to be_empty
    end

    it "should always return a description" do
      expect(@movie[:description]).not_to be_empty
    end
  end

end