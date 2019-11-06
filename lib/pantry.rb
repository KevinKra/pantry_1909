class Pantry
  attr_reader :stock
  def initialize
    @stock = {}
  end

  def stock_check(query)
    return 0 if @stock[query] == nil
    @stock[query]
  end

  def restock(item, amount)
    @stock[item] = 0 if @stock[item] == nil
    @stock[item] += amount
  end

  def enough_ingredients_for?(recipe)
    req_ingredients = recipe.ingredients_required
    suffiecent_amounts = req_ingredients.reduce([]) do |accum, ingredient|
      stock = @stock.select { |k,v| k == ingredient[0] }
      stock.values[0] >= ingredient[1] ? accum << true : accum << false
    end.include?(false)
    suffiecent_amounts == true ? false : true
    # redo to break loop on first false bool
  end
end