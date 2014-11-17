module Api
  module V1
    class ReportsController < ApplicationController
      respond_to :json
      skip_before_filter :verify_authenticity_token, only: [:create]

      def index
        respond_with Report.all
      end

      def create
        binding.pry
        report = Report.new(params[:report])

        if report.save
          respond_with report
        else
          render json: { 'status' => '500' }
        end
      end

      def default_serializer_options  
        {root: false}  
      end 
    end
  end
end