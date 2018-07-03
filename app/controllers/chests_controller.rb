class ChestsController < ApplicationController

  get "/chests" do
    if logged_in?
      @chests = current_user.chests.all
      erb :"/chests/index.html"
    else
      redirect '/'
    end
  end

  get "/chests/new" do
    erb :"/chests/new.html"
  end

  post "/chests" do
    @chest = Chest.find_or_create_by(params)
    create(@chest)
  end

  get "/chests/:id" do
    @chest = Chest.find(params[:id])
    show(@chest)
  end

  get "/chests/:id/edit" do
    @chest = Chest.find(params[:id])
    edit(@chest)
  end

  post "/chests/:id/edit" do
    @chest = Chest.find(params[:id])
    update(@chest)
  end

  post "/chests/:id/delete" do
    @chest = Chest.find(params[:id])
    delete(@chest)
  end
end
