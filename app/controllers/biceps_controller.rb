class BicepsController < ApplicationController

  # GET: /biceps
  get "/biceps" do
    @biceps = Bicep.all
    erb :"/biceps/index.html"
  end

  # GET: /biceps/new
  get "/biceps/new" do
    erb :"/biceps/new.html"
  end

  # POST: /biceps
  post "/biceps" do
    @bicep = Bicep.find_or_create_by(params)
    redirect "/biceps/#{@bicep.id}"
  end

  # GET: /biceps/5
  get "/biceps/:id" do
    @bicep = Bicep.find(params[:id])
    erb :"/biceps/show.html"
  end

  # GET: /biceps/5/edit
  get "/biceps/:id/edit" do
    erb :"/biceps/edit.html"
  end

  # PATCH: /biceps/5
  patch "/biceps/:id" do
    redirect "/biceps/:id"
  end

  # DELETE: /biceps/5/delete
  delete "/biceps/:id/delete" do
    redirect "/biceps"
  end
end
