class ShouldersController < ApplicationController

  get "/shoulders" do
    @shoulders = Shoulder.all
    erb :"/shoulders/index.html"
  end

  get "/shoulders/new" do
    erb :"/shoulders/new.html"
  end

  post "/shoulders" do
    @shoulder = Shoulder.find_or_create_by(params)
    redirect "/shoulders/#{@shoulder.id}"
  end

  get "/shoulders/:id" do
    @shoulder = Shoulder.find(params[:id])
    erb :"/shoulders/show.html"
  end

  get "/shoulders/:id/edit" do
    @shoulder = Shoulder.find(params[:id])
    @shoulder.update(params)
    erb :"/shoulders/edit.html"
  end

  post "/shoulders/:id" do
    redirect "/shoulders/:id"
  end

  delete "/shoulders/:id/delete" do
    redirect "/shoulders"
  end
end
