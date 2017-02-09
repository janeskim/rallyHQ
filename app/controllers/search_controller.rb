class SearchController < ApplicationController
  
  def index
  end

  def bills
    query_url = CongressApiService.parse_request_params(params)
    @bills = CongressApiService.make_request(query_url)
    render "bills" => @bills
  end

  def legislators
    query_url = CongressApiService.parse_request_params(params)
    @legislators = CongressApiService.make_request(query_url)
    render "legislators" => @legislators
  end

end