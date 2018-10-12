require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_the_email_of_a_townhal_from_its_webpage
	doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/95/vaureal.html'))

	puts "Voici l'adresse mail de VAUREAL: "
	doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |link|
  		puts link.content
	end
end

get_the_email_of_a_townhal_from_its_webpage

def get_all_the_urls_of_val_doise_townhalls 
	doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))

	puts "Voici les Urls: "
	
	doc.css('a.lientxt').each do |link|
		link = link["href"].gsub("./","")

  		puts "http://annuaire-des-mairies.com/#{link}"
	end
end

get_all_the_urls_of_val_doise_townhalls