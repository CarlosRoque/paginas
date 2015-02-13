  class Paginas::ApplicationController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound do |exception|
         redirect_to root_url, :alert => exception.message
    end
  end
