class SessionsController < ApplicationController
  get "/login" do
    erb :'sessions/new'
  end

  post "/login" do
    user = User.find_by_name(params[:name])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
    end

    redirect "/"
  end
end
