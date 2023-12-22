require 'rails_helper'

describe 'Recipe Show Page' do  
  it 'shows the name, complexity and genre' do 
    recipe_1 = Recipe.create(name:"Lasagna", complexity:2, genre:"Italian")
    ingredient_1=Ingredient.create(name:"Pasta", cost:2)
    ingredient_2 =Ingredient.create(name:"Cheese",cost:4)
    ingredient_3=Ingredient.create(name:"Sauce",cost:3)

    RecipeIngredient.create(recipe:recipe_1, ingredient:ingredient_1)
    RecipeIngredient.create(recipe:recipe_1, ingredient:ingredient_2)
    RecipeIngredient.create(recipe:recipe_1,ingredient:ingredient_3)

    visit "recipes/#{recipe_1.id}"
    
    expect(page).to have_content("Name:#{recipe_1.name}")
    expect(page).to have_content("Complexity:#{recipe_1.complexity}")
    expect(page).to have_content("Genre:#{recipe_1.genre}")
  end   
  it 'shows a list of ingredients on the recipe' do
    recipe_1 = Recipe.create(name:"Lasagna",complexity:2,genre:"Italian")

    ingredient_1= Ingredient.create(name:"Pasta", cost:2)
    ingredient_2= Ingredient.create(name:"Cheese", cost:4)
    ingredient_3=Ingredient.create(name:"Sauce", cost:3)
    ingredient_4=Ingredient.create(name:"Pringles", cost:3)

    RecipeIngredient.create(recipe:recipe_1, ingredient:ingredient_1)
    RecipeIngredient.create(recipe:recipe_1, ingredient:ingredient_2)
    RecipeIngredient.create(recipe:recipe_1,ingredient:ingredient_3)

    visit "recipes/#{recipe_1.id}"

    expect(page).to have_content("Name:#{ingredient_1.name}")
    expect(page).to have_content("Name:#{ingredient_2.name}")
    expect(page).to have_content("Name:#{ingredient_3.name}")
    expect(page).to_not have_content("Name:#{ingredient_4.name}")
    end

    it 'should display total cost of recipe' do
      recipe_1 = Recipe.create(name:"Lasagna",complexity:2,genre:"Italian")

    ingredient_1= Ingredient.create(name:"Pasta", cost:2)
    ingredient_2= Ingredient.create(name:"Cheese", cost:4)
    ingredient_3=Ingredient.create(name:"Sauce", cost:3)
    ingredient_4=Ingredient.create(name:"Pringles", cost:3)

    RecipeIngredient.create(recipe:recipe_1, ingredient:ingredient_1)
    RecipeIngredient.create(recipe:recipe_1, ingredient:ingredient_2)
    RecipeIngredient.create(recipe:recipe_1,ingredient:ingredient_3)

    visit "recipes/#{recipe_1.id}"

    expect(page).to have_content("Total cost:#{recipe_1.total_cost}")
    end
    
    it 'has a form  to add an existing ingredient to the recipe' do 
      recipe_1 = Recipe.create(name:"Lasagna",complexity:2,genre:"Italian")

    ingredient_1= Ingredient.create(name:"Pasta", cost:2)
    ingredient_2= Ingredient.create(name:"Cheese", cost:4)
    ingredient_3=Ingredient.create(name:"Sauce", cost:3)
    ingredient_4=Ingredient.create(name:"Pringles", cost:3)

    RecipeIngredient.create(recipe:recipe_1, ingredient:ingredient_1)
    RecipeIngredient.create(recipe:recipe_1, ingredient:ingredient_2)
    RecipeIngredient.create(recipe:recipe_1,ingredient:ingredient_3)

    visit "recipes/#{recipe_1.id}"
      expect(page).to_not have_content(ingredient_4.name)
      fill_in :ingredient_id, with:ingredient_4.id 
      click_button "Add Ingredient"
      expect(current_path).to eq("/recipes/#{recipe_1.id}")
      expect(page).to have_content(ingredient_4.name)
    end

end