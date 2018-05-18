class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb '/landmarks/index'
  end

  get '/landmarks/new' do
    @figures = Figure.all
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    redirect ""
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(params[:id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do

    redirect ""
  end

end
