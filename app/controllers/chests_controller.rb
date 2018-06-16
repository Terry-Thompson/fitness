class ChestsController < ApplicationController

  get "/chests" do
    @chests = Chest.all
    erb :"/chests/index.html"
  end

  get "/chests/new" do
    erb :"/chests/new.html"
  end

  post "/chests" do
    @chest = Chest.find_or_create_by(params)
    redirect "/chests/#{@chest.id}"
  end

  get "/chests/:id" do
    @chest = Chest.find(params[:id])
    erb :"/chests/show.html"
  end

  get "/chests/:id/edit" do
    erb :"/chests/edit.html"
  end

  post "/chests/:id" do
    @chest = Chest.find(params[:id])
    redirect "/chests/:id"
  end

  post "/chests/:id/delete" do
    @chest = Chest.find(params[:id])
    redirect "/chests"
  end
end
