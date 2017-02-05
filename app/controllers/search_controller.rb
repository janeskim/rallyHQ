class SearchController < ApplicationController
  
  def index
  end

  def bills
    query_url = CongressApiService.parse_request_params(params)
    response = CongressApiService.make_request(query_url)
    @bills = response["results"]
    render "bills" => @bills
  end

  def legislators
    query_url = CongressApiService.parse_request_params(params)
    response = CongressApiService.make_request(query_url)
    @legislators = response["results"]
    render "legislators" => @legislators
  end

end