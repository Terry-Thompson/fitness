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
    if filled_out(params)
      @back = Back.find_or_create_by(params)
      set_user_id(@back)
      redirect "/backs/#{@back.id}"
    else
      redirect "/backs/new"
    end
  end

  get "/backs/:id" do
    @back = Back.find(params[:id])
    erb :"/backs/show.html"
  end

  get "/backs/:id/edit" do
    @back = Back.find(params[:id])
    erb :"/backs/edit.html"
  end

  post "/backs/:id" do
    @back = Back.find(params[:id])
    @back.update(params)
    set_user_id(@back)
    redirect "/backs/:id"
  end

  post "/backs/:id/delete" do
    @back = Back.find(params[:id])
    @back.destroy
    redirect "/backs"
  end
end
