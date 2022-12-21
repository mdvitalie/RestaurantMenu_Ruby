# frozen_string_literal: true

# require 'uri'
require 'net/http'

class MenuController < ApplicationController
  def index
   # Weather API

    url = 'https://api.openweathermap.org/data/2.5/weather?lat=53.350140&lon=-6.266155&units=metric&appid=197128ae14d1b8c4d1779e83bd3c628e'

    uri = URI(url)
    res = Net::HTTP.get_response(uri)
    # puts res.body if res.is_a?(Net::HTTPSuccess)
    @data = JSON.parse(res.body)
    # console


    #Food menu API
    url2 = 'https://www.themealdb.com/api/json/v1/1/categories.php'

    uri2 = URI(url2)
    res2 = Net::HTTP.get_response(uri2)
    # puts res.body if res.is_a?(Net::HTTPSuccess)
    @foodmenu = JSON.parse(res2.body)
  end
end
