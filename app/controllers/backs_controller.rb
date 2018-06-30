require_all 'app'
class BacksController < ApplicationController

  get "/backs" do
    if logged_in?
      @backs = Back.all.collect {|b| b if match(b.user_id)}
      erb :"/backs/index.html"
    else
      redirect "/"
    end
  end

  get "/backs/new" do
    erb :"/backs/new.html"
  end

  post "/backs" do
    @back = Back.find_or_create_by(params)
    create(@back)
  end

  get "/backs/:id" do
    @back = Back.find(params[:id])
    show(@back)
  end

  get "/backs/:id/edit" do
    @back = Back.find(params[:id])
    edit(@back)
  end

  post "/backs/:id/edit" do
    @back = Back.find(params[:id])
    update(@back)
  end

  post "/backs/:id/delete" do
    @back = Back.find(params[:id])
    delete(@back)
  end
end
