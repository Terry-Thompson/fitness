class LegsController < ApplicationController

  get "/legs" do
    @legs = Leg.all.collect {|l| l if match(l.user_id)}
    erb :"/legs/index.html"
  end

  get "/legs/new" do
    erb :"/legs/new.html"
  end

  post "/legs" do
    if filled_out(params)
      @leg = Leg.find_or_create_by(params)
      set_user_id(@leg)
      redirect "/legs"
    else
      redirect "/legs/new"
    end
  end

  get "/legs/:id" do
    @leg = Leg.find(params[:id])
    erb :"/legs/show.html"
  end

  get "/legs/:id/edit" do
    @leg = Leg.find(params[:id])
    erb :"/legs/edit.html"
  end

  post "/legs/:id" do
    if filled_out?  
      @leg = Leg.find(params[:id])
      @leg.update(params)
      set_user_id(@leg)
      redirect "/legs/:id"
    else
      redirect "/legs/#{@leg.id}/edit"
    end
  end

  post "/legs/:id/delete" do
    @leg = Leg.find(params[:id]) 
    @leg.destroy
    redirect "/legs"
  end
end
