class BacksController < ApplicationController

  # GET: /backs
  get "/backs" do
    erb :"/backs/index.html"
  end

  # GET: /backs/new
  get "/backs/new" do
    erb :"/backs/new.html"
  end

  # POST: /backs
  post "/backs" do
    redirect "/backs"
  end

  # GET: /backs/5
  get "/backs/:id" do
    erb :"/backs/show.html"
  end

  # GET: /backs/5/edit
  get "/backs/:id/edit" do
    erb :"/backs/edit.html"
  end

  # PATCH: /backs/5
  patch "/backs/:id" do
    redirect "/backs/:id"
  end

  # DELETE: /backs/5/delete
  delete "/backs/:id/delete" do
    redirect "/backs"
  end
end
