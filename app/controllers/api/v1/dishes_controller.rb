# frozen_string_literal: true

module Api
  module V1
    class DishesController < ApplicationController
      def index
        dishes = query_dishes

        if include_categories?
          render json: dishes, include: ['categories']
        else
          render json: dishes
        end
      end

      def show
        dish = Dish.find(params[:id])

        if include_categories?
          render json: dish, include: ['categories']
        else
          render json: dish
        end
      end

      def create
        dish = Dish.new(dish_attributes)

        if dish.save
          render status: 201, json: dish
        else
          render status: 400
        end
      end

      def update
        dish = Dish.find(params[:id])

        if dish.update(dish_attributes)
          render json: dish
        else
          render status: 400
        end
      end

      def destroy
        dish = Dish.find(params[:id]);

        if dish.destroy
          render status: 204
        else
          render status: 400
        end
      end

      private

      def dish_attributes
        params.require(:attributes).permit(
          :name,
          :title,
          :description,
          images: [],
          places: []
        )
      end

      def include_categories?
        return false if params[:include_categories].blank?

        params[:include_categories] == 'true'
      end

      def query_dishes
        Dish.all.order(order_by => order_direction)
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
