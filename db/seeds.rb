require 'json'
require 'open-uri'

file = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
data_hash = JSON.parse(file)

data_hash["drinks"].each do |drink|
  Ingredient.create(name: drink["strIngredient1"])
end

rum = Ingredient.create(name: "Rum")
cola = Ingredient.create(name: "Cola")

rum_cola = Cocktail.create(name: "rum cola")

d1 = Dose.create(description: "a little", cocktail: rum_cola, ingredient: rum)
d2 = Dose.create(description: "a lot", cocktail: rum_cola, ingredient: cola)
