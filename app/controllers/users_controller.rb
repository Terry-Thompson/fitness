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

  # GET: /users/5
  get "/users/:id" do
    @user = User.find(params[:id])
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end

  get "/logout" do 
    session.clear
    redirect "/"
  end
end
