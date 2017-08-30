class ComputerController < ApplicationController
  get '/computers' do
    if logged_in?
      @computers = Computer.all
      erb :'computer/computers'
    else
      redirect to '/login'
  end
end
