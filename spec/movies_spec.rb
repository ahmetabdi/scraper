require 'rspec'
require 'spec_helper'

describe Scraper::Movies do
  describe "Scraping the site" do
    before(:each) do
      @movies = Scraper::Movies.all#(1,1)
    end

    it "should return all movies for first five pages" do
      #expect(@movies.count).to eq(15)
    end
  end

  # describe "Scraping a comic" do
  #   before(:all) do
  #     @comic = Scraper::movies.all(1,1).first
  #   end

  #   it "should always return a title" do
  #     expect(@comic[:title]).not_to be_empty
  #   end

  #   it "should always return a url" do
  #     expect(@comic[:url]).not_to be_empty
  #   end

  #   it "should always return a main_image" do
  #     expect(@comic[:main_image]).not_to be_empty
  #   end

  #   it "should always return a download_link" do
  #     expect(@comic[:download_link]).not_to be_empty
  #   end

  # end
end