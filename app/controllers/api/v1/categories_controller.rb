# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < ApplicationController
      def index
        render json: Category.all,
               include: ['dishes']
      end

      def show
        render json: Category.find(params[:id]),
               include: ['dishes']
      end

      def create
        category = Category.new(category_attributes)

        if category.save
          render status: 201, json: category
        else
          render status: 400
        end
      end

      def update
        category = Category.find(params[:id])

        if category.update(category_attributes)
          render json: category, include: ['dishes']
        else
          render status: 400
        end
      end

      def destroy
        category = Category.find(params[:id]);

        if category.destroy
          render status: 204
        else
          render status: 400
        end
      end

      private

      def category_attributes
        params.require(:attributes).permit(
          :name,
          :title,
          :description,
          images: []
        )
      end
    end
  end
end
