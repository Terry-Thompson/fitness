class ChestsController < ApplicationController

  get "/chests" do
    @chests = Chest.all.collect {|c| c if match(c.user_id)}
    erb :"/chests/index.html"
  end

  get "/chests/new" do
    erb :"/chests/new.html"
  end

  post "/chests" do
    if filled_out(params)
      @chest = Chest.find_or_create_by(params)
      set_id(@chest)
      redirect "/chests/#{@chest.id}"
    else
      redirect "/chests/new"
    end
  end

  get "/chests/:id" do
    @chest = Chest.find(params[:id])
    erb :"/chests/show.html"
  end

  get "/chests/:id/edit" do
    @chest = Chest.find(params[:id])
    erb :"/chests/edit.html"
  end

  post "/chests/:id/edit" do
    if filled_out(params)
      @chest = Chest.find(params[:id])
      @chest.update(params)
      set_id(@chest)
      redirect "/chests"
    else
      redirect "/chests/#{params[:id]}/edit"
    end 
  end

  post "/chests/:id/delete" do
    @chest = Chest.find(params[:id])
    @chest.destroy
    redirect "/chests"
  end
end
