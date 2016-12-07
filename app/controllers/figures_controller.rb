require 'pry'
class FiguresController < ApplicationController

  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    #binding.pry
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    #binding.pry
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @titles = params[:figure][:title_ids]
    if @titles != nil
      @titles.each do |title|
        @figure.titles << Title.find(title)
      end
    end
    @landmarks = params[:figure][:landmark_ids]
    if @landmarks != nil
      @landmarks.each do |landmark|
        @figure.landmarks << Landmark.create(landmark)
      end
    end
    if !params["title"]["name"].empty?
      @figure.titles << Title.create(params[:title])
    end
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(params[:title])
    end
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:figure_id])
    #binding.pry
    @figure.name = params[:figure][:name]
    @titles = params[:figure][:title_ids]
    if @titles != nil
      @titles.each do |title|
        @figure.titles << Title.find(title)
      end
    end
    #binding.pry
    @landmarks = params[:landmark_ids]
    if @landmarks != nil
      @landmarks.each do |landmark|
        @figure.landmarks << Landmark.create(landmark)
      end
    end
    if !params["title"]["name"].empty?
      @figure.titles << Title.create(params[:title])
    end
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    #binding.pry
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

end
