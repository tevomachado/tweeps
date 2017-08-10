require 'net/http'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
  end

  def tweeps_service
    TweepsService.new
  end

  def most_relevants
    render json: tweeps_service.find_most_relevants
  end

  def most_mentions
    render json: tweeps_service.find_most_mentions
  end
end
