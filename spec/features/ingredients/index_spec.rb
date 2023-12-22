require 'rails_helper'

describe 'Ingredients Index Page' do  
  it 'lists all ingredients indcluding their name and cost' do 
    ingredient_1 =Ingredient.create(name:"Ground Beef", cost:2)
    ingredient_2 =Ingredient.create(name:"Salt", cost:4)
    visit '/ingredients'
    expect(page).to have_content("#{ingredient_1.name}: #{ingredient_1.cost}")
    expect(page).to have_content("#{ingredient_2.name}: #{ingredient_2.cost}")

  end 

  it 'displays ingredient names in alphabetical order' do 
    ingredient_2 = Ingredient.create(name: "Salt", cost:4)
    ingredient_1 = Ingredient.create(name: "Ground Beef", cost:2)
    ingredient_3 =Ingredient.create(name:"Pasta", cost:2)
    visit '/ingredients'

    expect(ingredient_1.name).to appear_before(ingredient_2.name)
    expect(ingredient_3.name).to appear_before(ingredient_2.name)
    expect(ingredient_1.name).to appear_before(ingredient_3.name)
    end
end
