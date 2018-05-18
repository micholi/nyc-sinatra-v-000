class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      @figure.titles << Title.create(name: params[:title])
    elsif !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(name: params[:landmark])
    end
    @figure.save
    redirect "figures/#{@figure.id}"
  end

  get '/figures/:id' do
    
  end

  get '/figures/:id/edit' do
    
  end

  patch '/figures/:id/edit' do
    
  end
  
end
