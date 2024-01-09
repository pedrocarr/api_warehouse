require 'httparty'
class RequestsController < ApplicationController
  before_action :authenticate_user!

def index
  @request = current_user.requests.new
end

def create
  @request = current_user.requests.new(request_params)

  if @request.save
    response = make_api_request(@request)

    redirect_to @request
  else
    render :index
  end
end

def show
  @request = current_user.requests.find(params[:id])
end

private

def request_params
  params.require(:request).permit(:url, :method, :body, :authorization, :headers, :parameters)
end

def make_api_request(request)
  response = HTTParty.get(request.url)
  if response.success?
    puts "Request successful. Body: #{response.body}, Status Code: #{response.code}"
  else
    puts "Request failed. Status Code: #{response.code}, Response Body: #{response.body}"
  end
  response
end
end
