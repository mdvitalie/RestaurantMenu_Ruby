# frozen_string_literal: true
#require 'uri'
require 'net/http'
class MenuController < ApplicationController
  def index
    #Weather API
    # url = "https://api.openweathermap.org/data/2.5/weather"
    url = "https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=197128ae14d1b8c4d1779e83bd3c628e";  

    uri = URI(url)
    res = Net::HTTP.get_response(uri)
    #puts res.body if res.is_a?(Net::HTTPSuccess)
    @data = JSON.parse(res.body)
    #console
  end
end
