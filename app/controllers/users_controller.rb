class UsersController < ApplicationController

  get "/users" do 
    erb :"/users/index.html"
  end

  post "/signup" do
    session.clear
    @user = User.create(email: params[:email], password: params[:password]) if filled_out(params)
      if @user && @user.authenticate(params[:password]) 
        session[:user_id] = @user.id
        redirect "/users/#{@user.id}"
      else
        #error flash message
        redirect "/"
      end
  end

  post "/login" do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
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
