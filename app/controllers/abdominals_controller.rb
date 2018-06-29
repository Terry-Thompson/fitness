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
    @ab = Abdominal.find_or_create_by(params)
      if logged_in?
        set_user_id(@ab)
        redirect "/abdominals"
      else
        redirect "/abdominals/new"
      end
  end

  get "/abdominals/:id" do
    @ab = Abdominal.find(params[:id])
      if logged_in? && verified(@ab)
        erb :"/abdominals/show.html"
      else
        redirect "/abdominals"
      end
  end

  get "/abdominals/:id/edit" do
    @ab = Abdominal.find(params[:id])
      if verified(@ab)
        erb :"/abdominals/edit.html"
      else
        redirect "/abdominals/#{params[:id]}"
      end
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
