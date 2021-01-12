module Api
  module V1
    class ArticlesController < ApplicationController
      def index
        articles = Article.order('created_at DESC')
        render json: {status: 'SUCCESS', message: 'Loaded articles', data: articles}, status: :ok
      end

      def show
        # byebug
        begin
          article = Article.find(params[:id])
        rescue => exception
          render json: {status: 'SUCCESS', message: 'No article found', data: article}, status: :ok
        end
        if article
          render json: {status: 'SUCCESS', message: 'Loaded article', data: article}, status: :ok
        end

      end
    end
  end
end
