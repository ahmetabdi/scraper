module Scraper
  class Movies

    def self.all(start_page = 1, last_page = 5)
      results = []
      doc = Nokogiri::HTML(open('http://www.wrzko.eu/movies/'))

      doc.css('.category_block').each do |block|
        result = OpenStruct.new

        url = block.at_css('.maintitle_base').search('a').map {|a| a['href']}.first

        result.type = :movie
        result.title = block.at_css('.maintitle_base').content.strip
        result.description = block.at_css('.description').content
        result.url = url

        movie = Nokogiri::HTML(open(url))

        # [0] NFO [1] Main Image [Rest] Other Images
        images = movie.at_css('.image').search('a').map {|a| a['href']}.collect! {|x| x if %r{\Ahttps?:\/\/.+\.(?:jpe?g|png)\z}.match(x) }.compact.inspect

        # movie.css('.postarea p').each do |p|
          # raise p.inspect
        # end

        results << result
      end
      results
    end

    def self.last_page
      Nokogiri::HTML(open('http://www.wrzko.eu/movies/')).css('#board_index > div.wp-pagenavi > div > span.pages').first.to_s.split(' ').last.tr('</span>', '')
    end

  end
end