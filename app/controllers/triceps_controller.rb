class TricepsController < ApplicationController

  get "/triceps" do
    @triceps = Tricep.all.collect {|t| t if match(t.user_id)}
    erb :"/triceps/index.html"
  end

  get "/triceps/new" do
    erb :"/triceps/new.html"
  end

  post "/triceps" do
    @tricep = Tricep.find_or_create_by(params)
    set_user_id(@tricep)
    redirect "/triceps"
  end

  get "/triceps/:id" do
    @tricep = Tricep.find(params[:id])
    erb :"/triceps/show.html"
  end

  get "/triceps/:id/edit" do
    @tricep = Tricep.find(params[:id])
    erb :"/triceps/edit.html"
  end

  post "/triceps/:id" do
    @tricep = Tricep.find(params[:id])
    @tricep.update(params)
    set_user_id(@tricep)
    redirect "/triceps/#{@tricep.id}"
  end

  post "/triceps/:id/delete" do
    @tricep = Tricep.find(params[:id])
    @tricep.destroy
    redirect "/triceps"
  end
end
