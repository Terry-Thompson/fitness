require_all 'app'
class AbdominalsController < ApplicationController

  get "/abdominals" do
    @user = current_user
    @abs = Abdominal.all
    erb :"/abdominals/index.html"
  end

  get "/abdominals/new" do
    erb :"/abdominals/new.html"
  end

  post "/abdominals" do
    @ab = Abdominal.find_or_create_by(params)
    redirect :"/abdominals/#{@ab.id}"
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
    @ab = Abdominal.find(params[:id])
    @ab.update(params)
    redirect "/abdominals/#{@ab.id}"
  end

  post "/abdominals/:id/delete" do
    @ab = Abdominal.find(params[:id])
    @ab.destroy
    redirect "/abdominals"
  end
end
