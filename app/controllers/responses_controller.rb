class ResponsesController < ApplicationController
  def index
    @requests = Request.all
  end

  def show
    @response = Response.find(params[:id])
  end
end
