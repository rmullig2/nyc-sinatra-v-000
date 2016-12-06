require 'pry'
class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    #binding.pry
    @figure = Figure.find_or_create_by(:name => params[:figure][:name])
    @titles = params[:figure][:title_ids]
    @titles.each do |title|
      @figure.titles << Title.find(title)
    end
    binding.pry
    @landmarks = params[:figure][:landmark_ids]
    @landmarks.each do |landmark|
      @figure.landmarks << Landmark.find(landmark)
    end
    @figure.save
  end

end
