require "minitest"
require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/ingredient.rb"

class IngredientTest < Minitest::Test
  def setup
    @ingredient = Ingredient.new("Cheese", "oz", "calories")
  end

  def test_it_exists
    assert_instance_of Ingredient, @ingredient
  end

  def test_it_has_attributes
    assert_equal "Cheese", @ingredient.name
    assert_equal "oz", @ingredient.unit
    assert_equal "calories", @ingredient.calories
  end
end