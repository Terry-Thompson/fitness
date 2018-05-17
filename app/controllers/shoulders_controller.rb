class ShouldersController < ApplicationController

  # GET: /shoulders
  get "/shoulders" do
    erb :"/shoulders/index.html"
  end

  # GET: /shoulders/new
  get "/shoulders/new" do
    erb :"/shoulders/new.html"
  end

  # POST: /shoulders
  post "/shoulders" do
    redirect "/shoulders"
  end

  # GET: /shoulders/5
  get "/shoulders/:id" do
    erb :"/shoulders/show.html"
  end

  # GET: /shoulders/5/edit
  get "/shoulders/:id/edit" do
    erb :"/shoulders/edit.html"
  end

  # PATCH: /shoulders/5
  patch "/shoulders/:id" do
    redirect "/shoulders/:id"
  end

  # DELETE: /shoulders/5/delete
  delete "/shoulders/:id/delete" do
    redirect "/shoulders"
  end
end
