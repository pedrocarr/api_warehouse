require 'httparty'

class RequestsController < ApplicationController
  before_action :authenticate_user!

def index
  @request = current_user.requests.new
end

def create
  @request = current_user.requests.new(request_params)

  if @request.save
    begin
      response = make_api_request(@request)
      @request.create_response(body: response.body, status_code: response.code)

      respond_to do |format|
        format.html { redirect_to requests_path }
        format.json { render json: { body: response.body, status_code: response.code } }
      end
    rescue HTTParty::Error => e
      handle_httparty_error(e)
    end
  else
    render :index
  end
end

def show
  @request = current_user.requests.find(params[:id])
end

private

def request_params
  params.require(:request).permit(:url)
end

def make_api_request(request)
  HTTParty.get(request.url)
end

def handle_httparty_error(error)
  Rails.logger.error("HTTParty Error: #{error.message}")

  respond_to do |format|
    format.html { redirect_to requests_path, alert: 'Request failed.' }
    format.json { render json: { error: 'Request failed.' }, status: :unprocessable_entity }
  end
end
end
