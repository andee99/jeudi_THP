require 'rubygems'
require 'nokogiri'
require 'open-uri'

def trader_de_lobscur
	price_tab = []
	name_tab = []
	price_counter = 0
	name_counter = 0

	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	doc.css('a.currency-name-container.link-secondary').each do |names|
		name_tab[name_counter] = names.text
		name_counter += 1 
	end

	doc.css('a.price').each do |price|
		price_tab[price_counter] = price.text
		price_counter += 1
		
	end

	crypto = name_tab.zip(price_tab).to_h
	puts crypto
end

trader_de_lobscur