require 'rubygems'
require 'nokogiri'
require 'open-uri'

def député
	mail_tab = []
	name_tab = []
	mail_counter = 0
	name_counter = 0


	doc = Nokogiri::HTML(open('http://www2.assemblee-nationale.fr/deputes/liste/alphabetique'))
	doc.css('ul li a').each do |names|
		name_tab[name_counter] = names.text
		name_counter += 1
	end

	doc.css('a href').each do ||
		mail_tab[mail_counter] = mail.text
		mail_counter += 1
		
	end
	depute_tab = name_tab.zip(mail_tab).to_h
	puts depute_tab
end

député