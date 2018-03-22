from recipe.recipe import Recipe
from server.server_interface import ServerInterface
from server.dao_recipe import DaoRecipe

def main():
    '''
    recipe_1 = Recipe()
    recipe_1.recipe_id = "R01"
    recipe_1.recipe_name = 'Spicy Kale Slaw'
    recipe_1.calories = 333
    recipe_1.fat = 24
    recipe_1.protein = 24
    recipe_1.sodium = 292
    recipe_1.sugar = 30
    recipe_1.carbs = 0
    recipe_1.to_string()
    '''
    server_interface=ServerInterface()
    dao = DaoRecipe()
    #ingredients_of_recipe = server_interface.get_ingredient_in_recipe()
    #recipes = server_interface.get_recipes()
    #print(recipes)
    #recipes_instance = dao.build_recipe(recipes[0])
    #print(recipes_instance)

    ingredients = server_interface.get_ingredients()
    print(ingredients)
if __name__ == "__main__":
    main()