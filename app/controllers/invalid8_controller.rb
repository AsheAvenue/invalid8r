class Invalid8Controller < ApplicationController
  
  def index  
  end
  
  def handle
    @sitekey = params[:sitekey]
    @path = request.query_string
  end
  
end
