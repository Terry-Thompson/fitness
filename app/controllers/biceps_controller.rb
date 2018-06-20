class BicepsController < ApplicationController

  get "/biceps" do
    if logged_in?
      binding.pry
      @biceps = Bicep.all.collect {|b| b if match(b.user_id)}
      erb :"/biceps/index.html"
    else
      redirect '/'
    end
  end

  get "/biceps/new" do
    erb :"/biceps/new.html"
  end

  post "/biceps" do
    if filled_out(params)
      @bicep = Bicep.find_or_create_by(params)
      set_user_id(@bicep)
      redirect "/biceps/#{@bicep.id}"
    else
      redirect "/biceps/new"
    end
  end

  get "/biceps/:id" do
    @bicep = Bicep.find(params[:id])
    erb :"/biceps/show.html"
  end

  get "/biceps/:id/edit" do
    @bicep = Bicep.find(params[:id])
    @bicep.user_id = current_user.id
    erb :"/biceps/edit.html"
  end

  post "/biceps/:id/edit" do
    if filled_out(params)
      @bicep = Bicep.find(params[:id])
      @bicep.update(params)
      set_user_id(@bicep)
      redirect "/biceps/#{@bicep.id}"
    else
      redirect "/biceps/#{params[:id]}/edit"
    end
  end

  post "/biceps/:id/delete" do
    @bicep = Bicep.find(params[:id])
    @bicep.destroy
    redirect "/biceps"
  end
end
