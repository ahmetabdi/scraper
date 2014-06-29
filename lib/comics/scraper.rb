module Comics
  class Scraper

    def self.all(start_page = 1, last_page = 5)
      results = []
      start_page.upto(last_page).each do |i|
        doc = Nokogiri::HTML(open("http://www.newcomic.org/page/#{i}/"))

        doc.css('.story_short').each do |block|
          result = Hash.new

          url = block.search('a').map {|a| a['href']}.first

          result.merge!({
            :title => block.at_css('.story_h').content,
            :url => url })

          comic = Nokogiri::HTML(open(url))

          result.merge!({
            :main_image => main_image(comic),
            :other_images => other_images(comic),
            :download_link => download_link(comic),
            :tags => tags(comic) })

          results << result
        end

      end
      results
    end

    def self.main_image(comic)
      comic.at_css('.story_c').search('img').map {|a| a['src']}.first
    end

    def self.other_images(comic)
      comic.at_css('.story_c').search('a').map {|a| a['href']}.collect! {|x| x if %r{\Ahttps?:\/\/.+\.(?:jpe?g|png)\z}.match(x) }.compact
    end

    def self.download_link(comic)
      if comic.at_css('.story_c')
        comic.at_css('.story_c').search('a').map {|a| a['href']}.first
      end
    end

    def self.tags(comic)
      if comic.at_xpath('//*[@id="dle-content"]/div/article/div[2]/p/i')
        comic.at_xpath('//*[@id="dle-content"]/div/article/div[2]/p/i').content.gsub('Tags: ', '').split(',').collect(&:strip)
      end
    end

  end
end