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
    create(@shoulder)
  end

  get "/shoulders/:id" do
    @shoulder = Shoulder.find(params[:id])
    show(@shoulder)
  end

  get "/shoulders/:id/edit" do
    @shoulder = Shoulder.find(params[:id])
    edit(@shoulder)
  end

  post "/shoulders/:id" do
    @shoulder = Shoulder.find(params[:id])
    update(@shoulder)
  end

  post "/shoulders/:id/delete" do
    @shoulder = Shoulder.find(params[:id])
    delete(@shoulder)
  end
end
