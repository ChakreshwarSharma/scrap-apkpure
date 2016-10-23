class ScrapController < ApplicationController
  before_action :connect_apkpure, except: [:welcome]
  def index
    require 'csv'
    apk = Hash.new
    json_response = []
    page_data = @page.css('.top-list')
    csv_response = CSV.generate do |csv|
      csv << ['name','icon_image','download_link_url']
      page_data.each do |page|
        page.css('li').each do |p|
          apk['name'] = p.css('.title-dd').text
          apk['icon_image'] = p.css('img').attribute('src').value
          apk['download_link'] = (@url + p.css('.down a').first.attribute('href').value)
          csv << [apk['name'], apk['icon_image'], apk['download_link']]
          json_response << apk
        end
      end
    end
    if params[:req_type] == 'json'
      render json: json_response
    else
      render json: csv_response
    end
  end
  
  def welcome
    
  end
  
  def all_links
    a = []
    b = Hash.new
#    binding.pry
#    a << @page.links_with.to_a
# binding.pry
#    @page.links_with.each do |l,index|
#     
#      b[index] = l
#      a << b
#    end
#    render raw: @page.links_with
render nothing: true
  end
  
  private
  def connect_apkpure
    require 'mechanize'
    mechanize = Mechanize.new
    @url = 'https://apkpure.co/'
    @page = mechanize.get(@url)
  end
  
end
