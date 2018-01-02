class FiguresController < ApplicationController

  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(name: params["figure"]["name"])
    if !Title.find_by_id(params["figure"]["title_ids"])
      @figure.titles << Title.create(name: params["title"]["name"])
    else
      @figure.titles << Title.find_by_id(params["figure"]["title_ids"])
    end

    if !Landmark.find_by_id(params["figure"]["landmark_ids"])
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
    else
      @figure.landmarks << Landmark.find_by_id(params["figure"]["landmark_ids"])
    end

    @figure.save
    redirect to '/figures/:id'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

end
