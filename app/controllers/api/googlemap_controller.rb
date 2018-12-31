class Api::GooglemapController < ApplicationController

  def create
    location = params["location"].split(' ').join('+')
    @result = RestClient.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{location}&key=AIzaSyCzo_yYjLeqwE75EEfITGE_whvhHot6z1k")
    @json = JSON.parse(@result)
    if @json["status"] == "OK"
      @coordinates = @json["results"][0]["geometry"]["location"]
      render json: @coordinates
    else
      render json: {"error": "location not found"}
    end

  end

end
