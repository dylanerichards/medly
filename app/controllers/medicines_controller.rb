class MedicinesController < ApplicationController
  post "/medicines" do
    medicine = Medicine.create(params)

    redirect "/"
  end

  get "/medicines/:id/edit" do
    @medicine = Medicine.find(params[:id])

    erb :'medicines/edit'
  end

  post "/medicines/:id" do
    medicine = Medicine.find(params[:id])

    medicine.update(params)

    redirect "/"
  end

  delete "/medicines/:id" do
    medicine = Medicine.find(params[:id])

    medicine.destroy

    redirect "/"
  end
end
