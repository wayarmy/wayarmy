require "wayarmy/version"
require "rest-client"

module Wayarmy
  class Main
    def request
      @code = 200
      @gitlab_url = "https://gitlab.com"
      RestClient.get(@gitlab_url) { |response, request, result, &block| response
        if response.code != 200
          @code = response.code
        end
      }
      @code
    end

    def get_response_time
      time_begin = Time.now
      request
      time_end = Time.now
      @resp_time = (time_end - time_begin)*1000
    end

    def start
      now = Time.now.to_i
      time = now

      resp_list = []
      until time >= now + 60 do
        if time == now || Time.now.to_i >= time + 10
          get_response_time
          resp_list << @resp_time
          puts "Response code: " + @code.to_s
          puts "Response Time: " + @resp_time.to_s + " ms"
          puts "----------------------------"
          sleep 0.1
          time = time + 10
        end
      end

      puts "Response Time average: " +  (resp_list.reduce(:+)/resp_list.size.to_f).to_s + " ms"
    end
  end
end
