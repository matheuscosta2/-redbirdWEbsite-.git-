#cat config.ru
require "roda"

class App < Roda
  
    plugin :partials
    plugin :public
    plugin :render

  route do |r|
    # GET / request
    r.root do
      @greeting_root = "The root page has a simple introduction to what is the RedBird. It has images, texts, and some blog entries. The primary purpose is to present and advertise the engine."
      view("index")
    end
    
    
    
      # /root branch
      r.on do
        # Set variable for all routes in /root
        @greeting_blog = "The blog page has a complete list of blog entries divide by page."
        @greeting_doc = "Ruby Yard generates de documentation through the comments in the code."
        @greeting_source = "Ruby Yard generates de documentation through the comments in the code."
        @greeting_about = "The about has a more detailed explanation than the one in the root page."
        @greeting_team = "The team is a list and brief information of all members of the group."

        # GET /blog request
        r.get "blog" do
            "#{@greeting_blog}!"
          end

        # GET /doc request
        r.on do
          # GET /doc request
          r.get "doc" do
            "#{@greeting_doc}!"
          end
          
        
        # GET /source request
        r.on do
          # GET /source request
          r.get "source" do
            "#{@greeting_source}!"
          end
        # GET /about about
        r.on do
          r.get "about" do
            "#{@greeting_about}!"
          end

          r.on do
            # GET /team request
            r.get "team" do
              "#{@greeting_team}!"
            end
            # POST /hello request
            r.post do
            puts "Someone said #{@greeting}!"
            r.redirect
          
            end
          end
        end
      end
    end
  end
end 
end

run App.freeze.app