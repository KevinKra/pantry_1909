class Recipe
  attr_reader :name, :ingredients_required
  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(type, amount)
    @ingredients_required[type] = amount
  end

  def amount_required(ingredient)
    @ingredients_required[ingredient]
  end

  def total_calories
    ingredients = @ingredients_required.keys
    ingredients.sum do |ingredient|
      ingredient.calories * @ingredients_required[ingredient]
    end
  end
end