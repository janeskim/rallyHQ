require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'pry'

module CongressApiService

  CONGRESS_API_BASE = "https://congress.api.sunlightfoundation.com/"

  def self.list_upcoming_bills
    query_url = "upcoming_bills"
    make_request(query_url)
  end

  def self.fetch_bill(bill_id)
    query_url = "bills/search?bill_id=\"#{bill_id}\""
    make_request(query_url)
  end

  def self.fetch_committee(committee_id)
    # returns information about committee
    query_url = "committees?per_page=all&committee_id=\"#{committee_id}\""
    make_request(query_url)
  end

  def self.fetch_committee_members(committee_id)
    # returns all legislators who belong to committee
    query_url = "committees?per_page=all&committee_id=\"#{committee_id}\"&fields=members"
    make_request(query_url)
  end

  def self.fetch_legislator_committees(bioguide_id)
    # returns all committees that legislator is part of
    query_url = "committees?per_page=all&member_ids=\"#{bioguide_id}\""
    make_request(query_url)
  end

  def self.fetch_legislator(bioguide_id)
    # /legislators?bioguide_id=F000444&
    query_url = "legislators?bioguide_id=\"#{bioguide_id}\""
    make_request(query_url)
  end

  def self.request_data(data)
    query_url = parse_request_params(data)
    response = make_request(query_url)
  end

  def self.parse_request_params(data)
    if data[:legislators]
      query_data = data[:legislators]
      query_url = search_for_legislators(query_data)
    elsif data[:bills]
      query_data = data[:bills]
      query_url = search_for_bill(query_data)
    end

    return query_url
  end

  def self.search_for_bill(query_data)
    query_string = query_data[:keyword].to_s
    request_params = "bills/search?history.active=true&query=\"#{query_string}\""
  end

  def self.search_for_legislators_by_query(query_data)
    queries = {}
    queries[:party] = query_data[:party].upcase.split('').first if query_data.has_key?(:party)
    queries[:chamber] = query_data[:chamber] if query_data.has_key?(:chamber)
    queries[:query] = query_data[:keyword] if query_data.has_key?(:keyword)

    query_string = ""
    queries.each { |key,value| query_string = query_string + "&#{key}=#{value}" }
    query_url = "legislators?#{query_string}"

    return query_url
  end

  def self.search_for_legislators(query_data)
    if query_data[:zipcode] != ""
      return "legislators/locate?zip=#{query_data[:zipcode]}"
    else
      return search_for_legislators_by_query(query_data)
    end
  end

  def self.make_request(query_url)
    encoded_url = URI.encode(CONGRESS_API_BASE + query_url)
    uri = URI(encoded_url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)
    return data["results"]
  end

end
