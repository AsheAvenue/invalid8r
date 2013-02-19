class Invalid8Controller < ApplicationController
  
  skip_before_filter  :verify_authenticity_token
  
  def index
    @options = Array.new
    Settings.invalid8r.each do |site|
      @options << site.sitekey
    end
    
    @sitekeys = Array.new
  end
  
  def handle
    #get the site key
    @sitekey = params[:sitekey]
    
    #and get the path
    @path = request.query_string
    
    #redirect if sitekey or path is missing
    if(@sitekey == "" || @path == "")
      redirect_to "/"
    end
    
    #loop through the settings
    Settings.invalid8r.each do |site|
      
      #stop when we get to the sitekey
      if (site.sitekey == @sitekey)
        
        #now loop through all the services
        @services = Array.new
        site.services.each do |service|
          
          #get the service name
          @services << service.name
          
          #loop through instances
          @instances = Array.new
          service.instances.each do |instance|
            entry = Hash.new
            entry["full_url"] = "http://#{instance.url}:#{instance.port}#{@path}"
            
            #execute the request and store the value
            response = varnish(entry["full_url"])
            
            #read the response
            if(response.include? "200 Purged")
              entry["response"] = "SUCCESS"
            else
              entry["response"] = "FAILED"
            end
            
            @instances << entry
          end
          
        end
        
      end
        
    end
    
  end
  
  def form
    #redirect to the handle action
    sitekey = params[:sitekey]
    path = params[:path]
    redirect_to "/#{sitekey}?#{path}"
  end
  
private

  def varnish(full_url)
    response = `curl -XPURGE #{full_url}`
    puts "|#{(response) ? 'true' : 'false'}|"
    return response
  end
end
