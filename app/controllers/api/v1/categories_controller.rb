# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < ApplicationController
      def index
        categories = Category.all.order(:name)

        if include_dishes?
          render json: categories, include: ['dishes']
        else
          render json: categories
        end
      end

      def show
        category = Category.find(params[:id])

        if include_dishes?
          render json: category, include: ['dishes']
        else
          render json: category
        end
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

      def include_dishes?
        return false if params[:include_dishes].blank?

        params[:include_dishes] == 'true'
      end
    end
  end
end
