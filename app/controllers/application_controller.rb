require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
      enable :sessions
      set :session_secret, 'password_security'
  end

  get "/" do
    erb :welcome
  end


  helpers do
    def logged_in?
      !!session[:user_id]
    end


    def filled_out(params)
      params.none?{|k,v| v.empty?}
    end
    

    def current_user
      User.find(session[:user_id])
    end
    

    def match(id)
      current_user.id == id
    end
  

    def set_user_id(obj)
      obj.user_id = current_user.id 
      obj.save 
    end


    def verified(obj)
      filled_out(params) && match(obj.user_id)
    end

    
    def problem
      flash[:message] = "There was a problem with your form"
    end

 
    def create(obj)
      if logged_in?
        set_user_id(obj)
        redirect "/#{obj.class.to_s.downcase}s"
      else
        redirect "/#{obj.class.to_s.downcase}s/new"
      end
    end


    def edit(obj)
      if verified(obj)
        erb :"/#{obj.class.to_s.downcase}s/edit.html"
      else
        problem
        redirect "/#{obj.class.to_s.downcase}s/#{params[:id]}"
      end
    end


    def update(obj)
      if verified(obj)
        obj.update(params)
        set_user_id(obj)
        flash[:message] = "Update successful"
        redirect "/#{obj.class.to_s.downcase}s"
      else
        problem
        redirect "/#{obj.class.to_s.downcase}/#{params[:id]}/edit"
      end
    end


    def delete(obj)
      if match(obj.user_id)
        obj.destroy
        flash[:message] = "#{obj.exercise_name} successfully deleted."
        redirect "/#{obj.class.to_s.downcase}s"
      else
        problem
        redirect "/#{obj.class.to_s.downcase}s/#{obj.id}"
      end
    end 

    
    def show(obj)
      if logged_in? && verified(obj)
        erb :"/#{obj.class.to_s.downcase}s/show.html"
      else
        problem
        redirect "/#{obj.class.to_s.downcase}s"
      end
    end


  end#of helpers
end# of class
