module Scraper
  class Movies

    def self.all(start_page = 1, last_page = 5)
      results = []
      doc = Nokogiri::HTML(open('http://www.wrzko.eu/movies/'))

      doc.css('.category_block').each do |block|
        result = OpenStruct.new

        url = block.at_css('.maintitle_base').search('a').map {|a| a['href']}.first

        result.title = block.at_css('.maintitle_base').content.strip
        result.description = block.at_css('.description').content
        result.url = url

        result.main_image = block.at_css('.image').search('img')[0]['src']
        result.imdb = block.at_css('.image').search('a')[0]['href']

        result.genres = []

        block.search('.genre').each do |genre|
          result.genres << genre.content
        end

        result.tags = []

        block.search('.ipsTag').each do |tag|
          result.tags << tag.content
        end

        movie = Nokogiri::HTML(open(url))

        result.images = []

        movie.at_css('.image').search('a').map {|a| a['href']}.collect! {|x| x if %r{\Ahttps?:\/\/.+\.(?:jpe?g|png)\z}.match(x) }.compact.each do |image|
          result.images << image
        end

        result.download_links = []

        movie.css('.postarea p').each do |p|
          result.download_links << p.content
        end

        results << result
      end
      results
    end

    def self.last_page
      Nokogiri::HTML(open('http://www.wrzko.eu/movies/')).css('#board_index > div.wp-pagenavi > div > span.pages').first.to_s.split(' ').last.tr('</span>', '')
    end

  end
end