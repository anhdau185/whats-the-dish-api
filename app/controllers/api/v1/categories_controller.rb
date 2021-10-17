# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < ApplicationController
      def index
        categories = Category.all
        render json: categories, include: ['dishes']
      end

      def show
        category = Category.find(params[:id])
        render json: category, include: ['dishes']
      end

      def create
        category_details = params
          .require(:attributes)
          .permit(:name, :title, :description, images: [])
        category = Category.new(category_details)

        if category.save
          render status: 201, json: category
        else
          render status: 400
        end
      end

      def update
        category = Category.find(params[:id])
        category_details = params
          .require(:attributes)
          .permit(:name, :title, :description, images: [])

        if category.update(category_details)
          render json: category, include: ['dishes']
        else
          render status: 400
        end
      end

      def destroy
        category = Category.find(params[:id])

        if category.destroy
          render status: 204
        else
          render status: 400
        end
      end
    end
  end
end
