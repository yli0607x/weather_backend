class Api::LocationsController < ApplicationController
    before_action :find_location, only: [:update]
    def index
      @locations = Location.all
      render json: @locations
    end
  
    # GET /api/v1/parties/:id
    def show
      @location = Location.find(params[:id])
      render json: @location, status: :ok
    end
  
    # POST /api/v1/parties
    def create
      # @location = location.create({ name: params[:name],theme: params[:theme] })
      # @location = location.create(params.require(:location).permit(:name, :theme))
      @location = Location.create(location_params)
      if @location.valid?
        render json: @location, status: :created
      else
        render json: @location.errors.full_messages, status: :unprocessable_entity
      end
    end
  
    def update
      @location.update(location_params)
      if @location.save
        render json: @location, status: :accepted
      else
        render json: { errors: @location.errors.full_messages }, status: :unprocessible_entity
      end
    end
  
    private
  
    def location_params
      params.permit(:name)
    end
  
    def find_location
      @location = Location.find(params[:id])
    end
  end
  