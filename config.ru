# encoding: utf-8
Encoding.default_external = 'UTF-8'

require "roda"

class App < Roda
    plugin :halt
    plugin :not_found do
    view("error/404")
    end
    plugin :partials
    plugin :public
    plugin :render

  route do |r|
    r.public 

    # GET / request
    r.root do
      r.redirect("/en")
    end

    r.on String do |lang|
      @lang = lang

      r.is do
       view("index")
      end      
        # GET /blog request
        r.get "blog" do
            view('blog')
          end
        # GET /doc request
        r.on do
          # GET /doc request
          r.get "doc" do
            view("doc")
          end       
        # GET /source request
        r.on do
          # GET /source request
          r.get "source" do
            view("source")
          end
        # GET /about about
        r.on do
          r.get "about" do
            view("about")
          end
          # GET /team request
          r.on do
            r.get "team" do
              view("team")
            end
          end
        end
      end
    end
  end
end 
end

run App.freeze.app