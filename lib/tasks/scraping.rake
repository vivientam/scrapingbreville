namespace :scraping do 
  desc "scraping Breville website"

  task :breville => :environment do
    # Product.each do |product|
      # record_data(product)
  
    require 'open-uri'

    require 'nokogiri'

    url = "http://www.breville.com.au/food-preparation/blenders.html"
    document = open(url).read 

    # puts document
    
    html_doc = Nokogiri::HTML(document)

    data_format = "div > div > div > div.price-box > span" 

    data_format_2 = "div > div > div > a.product-image > img"

    data_format_3 = "div > div > div > div > div.price-box"

    details = html_doc.css(data_format)

    details_2 = html_doc.css(data_format_2)

    details_3 = html_doc.css(data_format_3)

    details.each_with_index do |code_id, index|

      # puts details_3[index].text

      # puts details_3[index].text.gsub(details[index], "")

      # "details[index]"
      # details[index]

      # details_3.gsub("code_id", "")


      # puts "#{details_3[index].text}"
      

      # puts "#{code_id.text}: #{details_2[index]}: #{details_3[index].text}: "

      Product.create(:code_id => code_id.text, :product_image => details_2[index]["src"], :price => details_3[index].text)

    end

    

    # if not details.any?
    #   return
    # end

    # new_record = products.new

    # Product.create
  
  end
end