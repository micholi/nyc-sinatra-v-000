require 'pry'

class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    redirect "landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    binding.pry
    @landmark = Landmark.find_by(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(params[:id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by(params[:id])
    @landmark.update
    if !params[:figure][:name].empty?
      @landmark.figure = Figure.create(name: params[:figure][:name])
    end
    @landmark.save
    redirect "landmarks/#{landmark.id}"
  end

end
