class BacksController < ApplicationController

  # GET: /backs
  get "/backs" do
    @backs = Back.all
    erb :"/backs/index.html"
  end

  # GET: /backs/new
  get "/backs/new" do
    erb :"/backs/new.html"
  end

  # POST: /backs
  post "/backs" do
    @back = Back.find_or_create_by(params)
    redirect "/backs/#{@back.id}"
  end

  # GET: /backs/5
  get "/backs/:id" do
    @back = Back.find(params[:id])
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
  post "/backs/:id/delete" do
    redirect "/backs"
  end
end
