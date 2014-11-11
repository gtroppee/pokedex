module Api
  module V1
    class PokemonsController < ApplicationController
      respond_to :json

      def index
        respond_with Pokemon.first(20)
      end

      def show
        respond_with Pokemon.find_by(pkdx_id: params[:id])
      end
    end
  end
end