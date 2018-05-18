require 'pry'

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

    if !params["title"]["name"].empty?
   @figure.title << Title.create(name: params["title"]["name"])
   if !params["landmark"]["name"].empty?
  @figure.landmark << Landmark.create(name: params["landmark"]["name"])
 end
 @figure.save
 redirect "figures/#{@figure.id}"
    
  end
end
