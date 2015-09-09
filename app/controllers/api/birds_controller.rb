class Api::BirdsController < ApplicationController

  def create
    bird = Bird.new
    bird.build(params)
    if bird.save
       render :json => {status: 200, message: "Successfully Created!"}
    else
      render :json => {:status => 400,:errors => "Bad Request"}
    end
  end

  def show
    bird = Bird.where(id: params["id"]).first
    if bird.present?
      render :json => {status: 200, message: "Ok", body: bird}
    else
      render :json => {:status => 400,:errors => "Not Found"}
    end
  end

  def index
    birds = Bird.all
    if birds.present?
      render :json => {status: 200, message: "Ok", body: birds}
    else
      render :json => {:status => 404,:errors => "Not data Found"}
    end
  end

  def delete
    bird = Bird.where(id: params["id"]).first
    if bird.present?
      bird.delete
      render :json => {status: 200, message: "Ok"}
    else
      render :json => {:status => 400,:errors => "Not Found"}
    end
  end
end