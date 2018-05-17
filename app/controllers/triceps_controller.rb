class TricepsController < ApplicationController

  # GET: /triceps
  get "/triceps" do
    erb :"/triceps/index.html"
  end

  # GET: /triceps/new
  get "/triceps/new" do
    erb :"/triceps/new.html"
  end

  # POST: /triceps
  post "/triceps" do
    redirect "/triceps"
  end

  # GET: /triceps/5
  get "/triceps/:id" do
    erb :"/triceps/show.html"
  end

  # GET: /triceps/5/edit
  get "/triceps/:id/edit" do
    erb :"/triceps/edit.html"
  end

  # PATCH: /triceps/5
  patch "/triceps/:id" do
    redirect "/triceps/:id"
  end

  # DELETE: /triceps/5/delete
  delete "/triceps/:id/delete" do
    redirect "/triceps"
  end
end
