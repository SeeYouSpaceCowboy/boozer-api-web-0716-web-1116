module Api
  module V1
    class CocktailsController < ApplicationController
      def index
        render json: Cocktail.all
      end

      def show
        render json: Cocktail.find(params[:id])
      end

      def create

       cocktail = Cocktail.new(name: params[:name], description: params[:description], instructions: params[:instructions])
       cocktail.save

       params[:proportions].each do |proportion|
        ingredient = Ingredient.new(name: proportion[:ingredient_name])
        ingredient.save
         Proportion.new(amount: proportion[:amount], cocktail_id: cocktail.id, ingredient_id: ingredient.id).save
       end

        render json: cocktail
      end

      def edit

      end

      def update

      end

      def destroy

      end
    end
  end
end
