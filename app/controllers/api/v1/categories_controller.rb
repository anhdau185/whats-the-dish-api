# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :prepare_category

      def index
        categories = Category.all
        render json: categories, include: ['dishes']
      end

      def show
        category = Category.find(params[:id])
        render json: category, include: ['dishes']
      end
    end
  end
end
