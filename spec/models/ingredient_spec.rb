require "rails_helper"

RSpec.describe Ingredient, type: :model do

   describe "validations" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :cost }
   end

   describe "relationships" do
      it { should have_many :recipe_ingredients }
      it { should have_many(:recipes).through(:recipe_ingredients) }
   end

   describe 'class method' do 
      it 'order_by_name' do 
         ingredient_2 = Ingredient.create(name: "Salt", cost:4)
         ingredient_1 = Ingredient.create(name: "Ground Beef", cost:2)
         ingredient_3 =Ingredient.create(name:"Pasta", cost:2)

         expect(Ingredient.order_by_name).to eq([ingredient_1,ingredient_3,ingredient_2])
      end
  end
end