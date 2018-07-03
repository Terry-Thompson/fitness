class BicepsController < ApplicationController

  get "/biceps" do
    if logged_in?
      @biceps = current_user.biceps.all
      erb :"/biceps/index.html"
    else
      redirect '/'
    end
  end

  get "/biceps/new" do
    erb :"/biceps/new.html"
  end

  post "/biceps" do
    @bicep = Bicep.find_or_create_by(params)
    create(@bicep)
  end

  get "/biceps/:id" do
    @bicep = Bicep.find(params[:id])
    show(@bicep)
  end

  get "/biceps/:id/edit" do
    @bicep = Bicep.find(params[:id])
    edit(@bicep)
  end

  post "/biceps/:id/edit" do
    @bicep = Bicep.find(params[:id])
    update(@bicep)
  end

  post "/biceps/:id/delete" do
    @bicep = Bicep.find(params[:id])
    delete(@bicep)
  end
end
