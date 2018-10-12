require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_the_email_of_a_townhal_from_its_webpage(tableau)
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com#{tableau}"))
	doc.css('td')[7].text
end

def get_all_the_urls_of_val_doise_townhalls 
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	doc.css('a.lientxt').map do |url| url = url["href"].gsub("./", "/")
	end
end

get_all_the_urls_of_val_doise_townhalls.map{|url| get_the_email_of_a_townhal_from_its_webpage(url)}

def get_all_the_urls_of_val_doise_townhalls 
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	doc.css('a.lientxt').map do |url| url.text
	end
end

BONUS = get_all_the_urls_of_val_doise_townhalls.zip(get_all_the_urls_of_val_doise_townhalls.map{|url| get_the_email_of_a_townhal_from_its_webpage(url)}).to_h 
puts BONUS