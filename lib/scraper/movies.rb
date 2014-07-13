module Scraper
  class Movies

    def self.all
      doc = Nokogiri::HTML(open('http://www.wrzko.eu/movies/'))

      doc.css('.category_block').each do |block|
        puts title = block.at_css('.maintitle_base').content.strip
        puts url = block.at_css('.maintitle_base').search('a').map {|a| a['href']}.first
        puts description = block.at_css('.description').content
        puts scene = block.at_css('div.border > div > div > table > tbody > tr.header > th:nth-child(2) > span > a').content
      end
    end

    def self.last_page
      Nokogiri::HTML(open('http://www.wrzko.eu/movies/')).css('#board_index > div.wp-pagenavi > div > span.pages').first.to_s.split(' ').last.tr('</span>', '')
    end

  end
end