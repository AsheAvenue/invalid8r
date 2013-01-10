class Invalid8Controller < ApplicationController
  
  def index
  end
  
  def handle
    #get the site key
    @sitekey = params[:sitekey]
    
    #find the config element that matches the sitekey
    @test = Application.config
    
    @path = request.query_string
  end
  
end
