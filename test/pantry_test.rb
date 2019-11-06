require "minitest"
require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/pantry.rb"
require_relative "../lib/ingredient.rb"
require_relative "../lib/recipe.rb"

class PantryTest < Minitest::Test
  def setup
    @cheese = Ingredient.new("Cheese", "C", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @pantry = Pantry.new
    @mac_and_cheese.add_ingredient(@mac, 8)
    @mac_and_cheese.add_ingredient(@cheese, 2)
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_it_has_attributes
    assert_kind_of Hash, @pantry.stock
    assert_empty @pantry.stock
  end

  def test_it_can_check_stock_and_restock
    assert_equal 0, @pantry.stock_check(@cheese)
    @pantry.restock(@cheese, 10)
    assert_equal 10, @pantry.stock_check(@cheese)
    @pantry.restock(@cheese, 5)
    @pantry.restock(@mac, 13)
    assert_equal 15, @pantry.stock_check(@cheese)
  end

  def test_it_can_determine_enough_ingredients
    @pantry.restock(@cheese, 10)
    @pantry.restock(@mac, 1)
    assert_equal false, @pantry.enough_ingredients_for?(@mac_and_cheese)
    @pantry.restock(@mac, 7)
    assert_equal true, @pantry.enough_ingredients_for?(@mac_and_cheese)
  end
end