module Comics
  class Scraper
    def self.all(start_page = 1, last_page = 5)
      results = {:results => nil}
      start_page.upto(last_page).each do |i|
        doc = Nokogiri::HTML(open("http://www.newcomic.org/page/#{i}/"))

        doc.css('.story_short').each do |block|
          results[:results] = Array.new
          results[:results] << {:title => block.at_css('.story_h').content,
            :url => block.search('a').map {|a| a['href']}.first }
          # result.inject(results, :update)
        end

      end
      results
    end

    def self.last_page
      Nokogiri::HTML(open('http://www.newcomic.org/')).search('#dle-content > div.basenavi > span.navigation > a:nth-child(12)').first.children[0].to_s.to_i
    end
  end
end