class PagesController < ApplicationController
  def index; end

  def my_endpoint
    render json: { name: params[:name] }, status: :ok
  end
end
