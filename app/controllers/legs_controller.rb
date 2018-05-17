class LegsController < ApplicationController

  # GET: /legs
  get "/legs" do
    erb :"/legs/index.html"
  end

  # GET: /legs/new
  get "/legs/new" do
    erb :"/legs/new.html"
  end

  # POST: /legs
  post "/legs" do
    redirect "/legs"
  end

  # GET: /legs/5
  get "/legs/:id" do
    erb :"/legs/show.html"
  end

  # GET: /legs/5/edit
  get "/legs/:id/edit" do
    erb :"/legs/edit.html"
  end

  # PATCH: /legs/5
  patch "/legs/:id" do
    redirect "/legs/:id"
  end

  # DELETE: /legs/5/delete
  delete "/legs/:id/delete" do
    redirect "/legs"
  end
end
