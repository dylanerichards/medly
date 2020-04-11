class UsersController < ApplicationController

  get "/users/new" do
    erb :'/users/new'
  end

  post "/users" do
    user = User.create(
      params
    )

    session[:user_id] = user.id

    redirect "/"
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

end
