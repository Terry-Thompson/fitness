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
    create(@tricep)
  end

  get "/triceps/:id" do
    @tricep = Tricep.find(params[:id])
    show(@tricep)
  end

  get "/triceps/:id/edit" do
    @tricep = Tricep.find(params[:id])
    edit(@tricep)
  end

  post "/triceps/:id" do
    @tricep = Tricep.find(params[:id])
    update(@tricep)
  end

  post "/triceps/:id/delete" do
    @tricep = Tricep.find(params[:id])
    delete(@tricep)
  end
end
