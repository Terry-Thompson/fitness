class UsersController < ApplicationController

  get "/users" do 
    erb :"/users/index.html"
  end

  post "/users/new" do
    session.clear
    @user = User.find_or_create_by(email: params[:email], password_digest: params[:password]) if filled_out(params)
      if @user 
        session[:user_id] = @user.id
        redirect "/users/#{@user.id}"
      else
        #error flash message
        redirect "/"
      end
  end

  post "/users" do
    user = User.find_by(email: params[:email])
    if user 
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      #redirect
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
