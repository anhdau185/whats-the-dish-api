# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < ApplicationController
      def index
        categories = query_categories

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

      def query_categories
        Category.all.order(order_by => order_direction)
      end

      def category_attributes
        params.require(:attributes).permit(
          :name,
          :title,
          :description,
          images: [],
          dish_ids: []
        )
      end

      def include_dishes?
        return false if params[:include_dishes].blank?

        params[:include_dishes] == 'true'
      end

      def order_by
        return :name if params[:order_by].blank?

        params[:order_by].to_sym
      end

      def order_direction
        return :asc if params[:order_direction].blank?

        params[:order_direction].to_sym
      end
    end
  end
end
