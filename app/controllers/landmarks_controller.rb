require 'pry'
class LandmarksController < ApplicationController

  get '/landmarks' do
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  post '/landmarks' do
    Landmark.create(params[:Landmark])
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find(params[:landmark_id])
    @landmark.name = params[:landmark][:name]
    @landmark.year_completed = params[:landmark][:year_completed]
    #binding.pry
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end

end
