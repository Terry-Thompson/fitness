class UsersController < ApplicationController
use Rack::Flash

  post "/signup" do
    session.clear
    @user = User.create(email: params[:email], password: params[:password]) if filled_out(params)
      if @user && @user.authenticate(params[:password]) 
        session[:user_id] = @user.id
        redirect "/users/#{@user.id}"
      else
        flash[:message] = "Sign up Failed"
        redirect "/"
      end
  end

  post "/login" do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      flash[:message] = "Login failed"
      redirect '/'
    end
  end

  get "/users/:id" do
    @user = User.find(params[:id])
    erb :"/users/show.html"
  end

  get "/logout" do 
    session.clear
    redirect "/"
  end
end
