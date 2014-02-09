class Scraper
	def self.scrape
		data = HTTParty.get('http://www.brainyquote.com/quotes/authors/c/charlie_sheen.html')

		response_body = data.response.body

		doc = Nokogiri::HTML(response_body)
		

		quotes = []
		doc.css('.bqQuoteLink a').each do |link|
			quotes << link.content
		end
		
		quotes.sample

	end
end