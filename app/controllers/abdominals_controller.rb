require_all 'app'
class AbdominalsController < ApplicationController

  get "/abdominals" do
    if logged_in?
      @abs = current_user.abdominals.all
      erb :"/abdominals/index.html"
    else
      redirect "/"
    end
  end

  get "/abdominals/new" do
    erb :"/abdominals/new.html"
  end

  post "/abdominals" do
    @ab = Abdominal.find_or_create_by(params)
    create(@ab)
  end

  get "/abdominals/:id" do
    @ab = Abdominal.find(params[:id])
    show(@ab)
  end

  get "/abdominals/:id/edit" do
    @ab = Abdominal.find(params[:id])
    edit(@ab)
  end

  post "/abdominals/:id/edit" do
    @ab = Abdominal.find(params[:id])
    update(@ab)
  end

  post "/abdominals/:id/delete" do  
    @ab = Abdominal.find(params[:id])
    delete(@ab)
  end

end
