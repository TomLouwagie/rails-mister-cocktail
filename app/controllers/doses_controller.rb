class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    cocktail = Cocktail.find(params[:cocktail_id])
    ingredient = Ingredient.find(params["dose"]["ingredient_id"])
    description = params["dose"]["description"]
    dose = Dose.new(cocktail: cocktail, ingredient: ingredient, description: description )
    if dose.save
      redirect_to cocktail_path(cocktail)
    end
    # else
    #   # render new_cocktail_dose_path(@cocktail)
    # end
  end

  def edit
    @cocktail  = Cocktail.find(params[:cocktail_id])
    @dose = Dose.find(params[:id])
  end

  def update
    @dose = Dose.find(params[:id])
    @dose.update(dose_params)
    redirect_to cocktails_path
  end

  def destroy
    dose = Dose.find(params[:id])
    @cocktail = Cocktail.find(params[:cocktail_id])
    dose.delete
    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient) 
  end

  # params[:dose]
end
