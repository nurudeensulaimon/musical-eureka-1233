require "rails_helper"

RSpec.describe Recipe, type: :model do
   
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe "relationships" do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  describe "instance method" do
    it "#total_cost" do 
      recipe_1 = Recipe.create(name:"Lasagna",complexity:2,genre:"Italian")

    ingredient_1= Ingredient.create(name:"Pasta", cost:2)
    ingredient_2= Ingredient.create(name:"Cheese", cost:4)
    ingredient_3=Ingredient.create(name:"Sauce", cost:3)
    ingredient_4=Ingredient.create(name:"Pringles", cost:3)

    RecipeIngredient.create(recipe:recipe_1, ingredient:ingredient_1)
    RecipeIngredient.create(recipe:recipe_1, ingredient:ingredient_2)
    RecipeIngredient.create(recipe:recipe_1,ingredient:ingredient_3)

    expect(recipe_1.total_cost).to eq(9)

    RecipeIngredient.create(recipe:recipe_1,ingredient:ingredient_3)

    expect(recipe_1.total_cost).to eq(12)
    end
  end
end