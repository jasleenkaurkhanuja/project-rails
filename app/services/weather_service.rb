class WeatherService 
    include HTTParty 
    @@base_uri = 'https://api.openweathermap.org/data/2.5'

    def initialize(key)
        @options = { query: {appid: key}}
    end

    def get_weather_by_city(city)
        HTTParty.get("#{@@base_uri}/weather?q=#{city}", @options)
        # response = self.class.get('/weather', @options.merge(query: {q: city}))
        # handle_response(response)
    end


# private 
#     def handle_response(response)
#         if response.success? 
#             response.parsed_response 
#         else 
#             puts "Weather api request failed: #{response.code} - #{response.message}"
#         end
#     end
end