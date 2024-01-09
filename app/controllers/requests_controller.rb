class RequestsController < ApplicationController
  before_action :authenticate_user!

def index
  @request = current_user.requests.new
end

def create
  @request = current_user.request.new(request_params)

  if @request.save
    response = make_api_request(@request)
    @request.create_response(body: response.body, status_code: response.code)

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
end
