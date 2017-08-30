class ComputerController < ApplicationController
  get '/computers' do
    if logged_in?
      @computers = Computer.all
      erb :'computer/computers'
    else
      redirect to '/login'
  end

  get '/computer/create_new' do
    if logged_in?
      erb :'tweets/create_tweet'
    else
      redirect to '/login'
    end
  end

  post '/computer' do
    if params[:name] == ""
      redirect to "/computer/create_new"
    else
      @computer = current_user.computer.create(name: params[:name], processor: params[:processor], processor_speed: params[:processor_speed], graphics_card: params[:graphics_card])
      redirect to "/computer/#{@computer.id}"
    end
  end


end
