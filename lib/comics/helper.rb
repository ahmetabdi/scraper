module Comics
  class Helper
    def self.last_page
      Nokogiri::HTML(open('http://www.newcomic.org/')).search('#dle-content > div.basenavi > span.navigation > a:nth-child(12)').first.children[0].to_s.to_i
    end
  end
end