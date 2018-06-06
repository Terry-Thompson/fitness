require_all 'app'
class AbdominalsController < ApplicationController

  # GET: /abdominals
  get "/abdominals" do
    @user = current_user
    erb :"/abdominals/index.html"
  end

  # GET: /abdominals/new
  get "/abdominals/new" do
    erb :"/abdominals/new.html"
  end

  # POST: /abdominals
  post "/abdominals" do
    redirect "/abdominals"
  end

  # GET: /abdominals/5
  get "/abdominals/:id" do
    erb :"/abdominals/show.html"
  end

  # GET: /abdominals/5/edit
  get "/abdominals/:id/edit" do
    erb :"/abdominals/edit.html"
  end

  # PATCH: /abdominals/5
  patch "/abdominals/:id" do
    redirect "/abdominals/:id"
  end

  # DELETE: /abdominals/5/delete
  delete "/abdominals/:id/delete" do
    redirect "/abdominals"
  end
end
