module Api
  module V1
    class RootController < ActionController::Base
      before_action :enforce_json_request_type
      
      private

      def enforce_json_request_type
        request.format = 'json'
      end
    end
  end
end
