require "minitest"
require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/Recipe.rb"
require_relative "../lib/Ingredient.rb"

class RecipeTest < Minitest::Test
  def setup
    @cheese = Ingredient.new("Cheese", "C", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)
    @recipe = Recipe.new("Mac and Cheese")
  end

  def test_it_exists
    assert_instance_of Recipe, @recipe
  end

  def test_it_has_attributes
    assert_equal "Mac and Cheese", @recipe.name
  end
  
  def test_it_can_add_ingredients
    assert_kind_of Hash, @recipe.ingredients_required
    assert_empty @recipe.ingredients_required
    @recipe.add_ingredient(@mac, 8)
    @recipe.add_ingredient(@cheese, 2)
    expected = {@mac => 8, @cheese => 2}
    assert_equal expected, @recipe.ingredients_required
  end

  def test_it_can_return_required_amount_of_ingredient
    @recipe.add_ingredient(@mac, 8)
    @recipe.add_ingredient(@cheese, 2)
    assert_equal 8, @recipe.amount_required(@mac)
    assert_equal 2, @recipe.amount_required(@cheese)
  end

  def test_it_can_return_the_total_calories
    @recipe.add_ingredient(@mac, 8)
    @recipe.add_ingredient(@cheese, 2)
    assert_equal 440, @recipe.total_calories
  end
end