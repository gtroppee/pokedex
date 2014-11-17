module Api
  module V1
    class PokemonsController < ApplicationController
      respond_to :json

      def index
        respond_with Pokemon.first(5)
      end

      def show
        respond_with Pokemon.find_by(pkdx_id: params[:id])
      end

      def default_serializer_options  
        {root: false}  
      end
    end
  end
end