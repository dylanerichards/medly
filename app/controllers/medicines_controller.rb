class MedicinesController < ApplicationController
  post "/medicines" do
    medicine = Medicine.create(params)

    redirect "/"
  end
end
