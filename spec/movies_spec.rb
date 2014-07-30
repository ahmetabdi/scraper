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

    it "should always return a title" do
      puts @movie.title
      expect(@movie.title).not_to be_empty
    end

    it "should always return a description" do
      puts @movie.description
      expect(@movie.description).not_to be_empty
    end

    it "should always return a url" do
      puts @movie.url
      expect(@movie.url).not_to be_empty
    end

    it "should return genres" do
      puts @movie.genres
    end

    it "should return tags" do
      puts @movie.tags
    end

    it "should return a main image" do
      puts @movie.main_image
    end

    it "should return images" do
      puts @movie.images
    end

    it "should return an imdb url" do
      puts @movie.imdb
    end

    it "should return download links" do
      puts @movie.download_links
    end
  end

end