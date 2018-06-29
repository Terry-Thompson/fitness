require './config/environment'

class ApplicationController < Sinatra::Base

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


    def _update(obj)
      if verified(obj)
        obj.update(params)
        set_user_id(obj)
        redirect "/#{obj.class.to_s.downcase}s"
      else
        redirect "/#{obj.class.to_s.downcase}/#{params[:id]}/edit"
      end
    end


    def delete(obj)
      if match(obj.user_id)
        obj.destroy
        redirect "/#{obj.class.to_s.downcase}s"
      else
        redirect "/#{obj.class.to_s.downcase}s/#{obj.id}"
      end
    end 

  end#of helpers
end# of class
