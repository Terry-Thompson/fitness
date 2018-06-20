class ShouldersController < ApplicationController

  get "/shoulders" do
    @shoulders = Shoulder.all.collect {|shoulder| shoulder if match(shoulder.user_id)}
    erb :"/shoulders/index.html"
  end

  get "/shoulders/new" do
    erb :"/shoulders/new.html"
  end

  post "/shoulders" do
    @shoulder = Shoulder.find_or_create_by(params)
    set_user_id(@shoulder)
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
    @shoulder = Shoulder.find(params[:id])
    @shoulder.update(params)
    set_user_id(@shoulder)
    redirect "/shoulders/:id"
  end

  post "/shoulders/:id/delete" do
    @shoulder = Shoulder.find(params[:id])
    @shoulder.destroy
    redirect "/shoulders"
  end
end
