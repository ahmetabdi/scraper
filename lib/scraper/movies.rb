module Scraper
  class Movies

    def self.all(start_page = 1, last_page = 5)
      results = []
      doc = Nokogiri::HTML(open('http://www.wrzko.eu/movies/'))

      doc.css('.category_block').each do |block|
        result = Hash.new

        result.merge!({
          :type => :movie,
          :title => block.at_css('.maintitle_base').content.strip,
          :url => block.at_css('.maintitle_base').search('a').map {|a| a['href']}.first,
          :description => block.at_css('.description').content
        })

        results << result
      end
      results
    end

    def self.last_page
      Nokogiri::HTML(open('http://www.wrzko.eu/movies/')).css('#board_index > div.wp-pagenavi > div > span.pages').first.to_s.split(' ').last.tr('</span>', '')
    end

  end
end