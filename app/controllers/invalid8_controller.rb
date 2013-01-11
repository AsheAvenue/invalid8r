require 'yaml'

class Invalid8Controller < ApplicationController
  
  def index
    
    puts "hi"
    puts Invalid8rConfig
    puts "bye"
    
    self.config.keys.each do |key, value|
      puts "Key: " << key
      puts "Value: " << value
    end
    
    @sitekeys = Array.new
  end
  
  def handle
    #get the site key
    @sitekey = params[:sitekey]
    
    #find the config element that matches the sitekey
    @test = Rails.config[@sitekey]
    
    @path = request.query_string
  end
  
end
