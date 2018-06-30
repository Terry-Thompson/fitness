class LegsController < ApplicationController

  get "/legs" do
    @legs = Leg.all.collect {|l| l if match(l.user_id)}
    erb :"/legs/index.html"
  end

  get "/legs/new" do
    erb :"/legs/new.html"
  end

  post "/legs" do
    @leg = Leg.find_or_create_by(params)
    create(@leg)
  end

  get "/legs/:id" do
    @leg = Leg.find(params[:id])
    show(@leg)
  end

  get "/legs/:id/edit" do
    @leg = Leg.find(params[:id])
    edit(@leg)
  end

  post "/legs/:id" do
    @leg = Leg.find(params[:id])
    update(@leg)
  end

  post "/legs/:id/delete" do
    @leg = Leg.find(params[:id]) 
    delete(@leg)
  end
end
