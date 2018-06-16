class BicepsController < ApplicationController

  get "/biceps" do
    @biceps = Bicep.all
    erb :"/biceps/index.html"
  end

  get "/biceps/new" do
    erb :"/biceps/new.html"
  end

  post "/biceps" do
    @bicep = Bicep.find_or_create_by(params)
    redirect "/biceps/#{@bicep.id}"
  end

  get "/biceps/:id" do
    @bicep = Bicep.find(params[:id])
    erb :"/biceps/show.html"
  end

  get "/biceps/:id/edit" do
    @bicep = Bicep.find(params[:id])
    erb :"/biceps/edit.html"
  end

  patch "/biceps/:id" do
    redirect "/biceps/:id"
  end

  delete "/biceps/:id/delete" do
    redirect "/biceps"
  end
end
