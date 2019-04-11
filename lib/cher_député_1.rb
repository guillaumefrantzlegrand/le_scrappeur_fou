require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

puts "Wait, might be long to come"

  def get_name
    page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
    page.xpath('//option').each do |feignasse|
    adress = "www2.assemblee-nationale.fr" + feignasse['value'] if feignasse['value'] != ""
      puts adress
    end
  end

  def get_email
        hash_feignasse = Hash.new("")
        list = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
        list.xpath('//option').each do |feignasse|
        if feignasse['value'] != ""
            adress = "http://www2.assemblee-nationale.fr"
            adress += feignasse ['value']
            last_name_first_name = feignasse.text
            last_name = last_name_first_name[2...last_name_first_name.size]
            first_name = last_name_first_name[1]
            page_feignasse = Nokogiri::HTML(open(adress))
            email = page_feignasse.xpath('//dd/ul/li/a')[1]['href'].split(":")[1] 
            hash_feignasse = {:Name=> last_name + first_name, :email=> email}
            
            puts hash_feignasse
        end
      
    end
end

def perform
    #get_name
    get_email
end

perform