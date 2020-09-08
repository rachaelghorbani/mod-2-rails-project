require 'net/http'
require 'open-uri'
require 'json'

class GetCourts
    
    URL = "https://www.nycgovparks.org/bigapps/DPR_Tennis_001.json"
    
    def get_courts
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        JSON.parse(response.body)
    end

end

