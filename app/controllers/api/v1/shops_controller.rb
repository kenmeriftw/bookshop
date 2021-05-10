module Api
  module V1
    class ShopsController < RootController
      def index
        @shops = Shop.all
      end
    end
  end
end
