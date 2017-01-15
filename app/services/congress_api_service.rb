require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'pry'

module CongressApiService

  CONGRESS_API_BASE = "https://congress.api.sunlightfoundation.com/"

  def self.list_upcoming_bills
    request_params = "upcoming_bills"
    make_request(request_params)
  end

  def self.request_data(data)
    request_params = parse_request_params(data)
    response = make_request(request_params)
  end

  def self.parse_request_params(data)
    if data[:legislators]
      query_data = data[:legislators]
      request_params = search_for_legislators(query_data)
    elsif data[:bills]
      query_data = data[:bills]
      request_params = search_for_bill(query_data)
    end

    return request_params
  end

  def self.search_for_bill(query_data)
    # short_title, official_title, popular_title, nicknames,  summary, and keywords
    query_string = query_data[:keyword].to_s
    request_params = "bills/search?query=\"#{query_string}\""
  end

  def self.search_for_legislators_by_query(query_data)
    queries = {}
    queries[:party] = query_data[:party].upcase if query_data.has_key?(:party)
    queries[:chamber] = query_data[:chamber] if query_data.has_key?(:chamber)
    queries[:query] = query_data[:keyword] if query_data.has_key?(:keyword)

    query_string = ""
    queries.each { |key,value| query_string = query_string + "&#{key}=#{value}" }    
    request_params = "legislators?#{query_string}"

    return request_params
  end

  def self.search_for_legislators(query_data)
    if query_data[:zipcode]
      return "legislators/locate?zip=#{query_data[:zipcode]}"
    else
      return search_for_legislators_by_query(query_data)
    end
  end

  def self.make_request(request_params)
    query_url = CONGRESS_API_BASE + request_params
    uri = URI(query_url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    response = Net::HTTP.get(uri)

    case response.code.to_i
    when 200 || 201
      data = JSON.parse(response)
      return data["results"]
    else
      return "Request failed"
    end
  end

end
