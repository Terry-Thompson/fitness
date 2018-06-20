require_all 'app'
class AbdominalsController < ApplicationController

  get "/abdominals" do
    if logged_in?
      @abs = Abdominal.all.collect {|a| a if match(a.user_id)}
      erb :"/abdominals/index.html"
    else
      redirect "/"
    end
  end

  get "/abdominals/new" do
    erb :"/abdominals/new.html"
  end

  post "/abdominals" do
    if filled_out(params)
      @ab = Abdominal.find_or_create_by(params)
      set_user_id(@ab)
      redirect :"/abdominals/#{@ab.id}"
    else
      redirect :"/abdominals/new"
    end
  end

  get "/abdominals/:id" do
    @ab = Abdominal.find(params[:id])
    erb :"/abdominals/show.html"
  end

  get "/abdominals/:id/edit" do
    @ab = Abdominal.find(params[:id])
    erb :"/abdominals/edit.html"
  end

  post "/abdominals/:id/edit" do
    if filled_out(params)
      @ab = Abdominal.find(params[:id])
      @ab.update(params)
      set_user_id(@ab)
      redirect "/abdominals"
    else
      redirect :"/abdominals/#{params[:id]}/edit"
    end
  end

  post "/abdominals/:id/delete" do
    @ab = Abdominal.find(params[:id])
    @ab.destroy
    redirect "/abdominals"
  end
end
