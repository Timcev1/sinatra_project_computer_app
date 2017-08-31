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
      erb :'computer/create_new'
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

  get '/computer/:id' do
    if logged_in?
      @computer = Computer.find_by_id(params[:id])
      erb :'computer/computer_show'
    else
      redirect to '/login'
    end
  end

  get '/computer/:id/edit' do
      @computer = Computer.find_by_id(params[:id])
      if logged_in? && @computer.user_id == current_user.id
       erb :'computer/edit'
    else
      redirect to '/login'
    end
  end

  patch '/computer/:id' do
    if params[:name] == ""
      redirect to "/computer/#{params[:id]}/edit"
    else
      @computer = Computer.find_by_id(params[:id])
      @computer.name = params[:name]
      @computer.processor = params[:processor]
      @computer.processor_speed = params[:processor_speed]
      @computer.graphics_card = params[:graphics_card]
      @computer.save
      redirect to "/computer/#{@computer.id}"
    end
  end

  delete '/computer/:id/delete' do
    if logged_in?
      @computer = Computer.find_by_id(params[:id])
      if @computer.user_id == current_user.id
        @computer.delete
        redirect to '/computers'
      else
        redirect to '/computers'
      end
    else
      redirect to '/login'
    end
  end
end

end
