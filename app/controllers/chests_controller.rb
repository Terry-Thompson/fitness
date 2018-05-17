class ChestsController < ApplicationController

  # GET: /chests
  get "/chests" do
    erb :"/chests/index.html"
  end

  # GET: /chests/new
  get "/chests/new" do
    erb :"/chests/new.html"
  end

  # POST: /chests
  post "/chests" do
    redirect "/chests"
  end

  # GET: /chests/5
  get "/chests/:id" do
    erb :"/chests/show.html"
  end

  # GET: /chests/5/edit
  get "/chests/:id/edit" do
    erb :"/chests/edit.html"
  end

  # PATCH: /chests/5
  patch "/chests/:id" do
    redirect "/chests/:id"
  end

  # DELETE: /chests/5/delete
  delete "/chests/:id/delete" do
    redirect "/chests"
  end
end
