require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'
require 'rspec'


PAGE_URL= "http://annuaire-des-mairies.com/val-d-oise.html" #page val d'oise donnée
@root = "http://annuaire-des-mairies.com" #page accueil France Mairies
puts "Please, Wait, it might could be long........sorrey!"
puts "-----------------------------------------------"
def get_email_of_a_city_council_from_this_webpage(url)
        doc = Nokogiri::HTML(open(url))
            doc.xpath('html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
end
def get_all_url_of_val_doise_city_council
        info = []
        array = []
        doc = Nokogiri::HTML(open(PAGE_URL))
        doc.xpath('//td/p/a/@href').each do |name|
            h = {}
            temp = name.text.sub(/^[.]/, @root)
            h["email"] = get_email_of_a_city_council_from_this_webpage(temp)
            info << h
        end
        doc.xpath('//td/p/a').each do |name|
            array << name.text
        
        end
        n = 0
        info.each do |town|
            town["name"] = array[n]
         n += 1
        end
        puts info
        puts "-------------------------------------------------------------------------"
        puts "TADAAAAAAAAAAAAA!"
end
get_all_url_of_val_doise_city_council