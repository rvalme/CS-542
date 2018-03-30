'''
    File name: dao_recipe.py
    Author: Chu Wang
    Date Created: 3/21/2018
    Date last modified: 3/23/2018
    Python Version:3.6
'''
from recipe.recipe import Recipe
import re
class DaoRecipe():
    '''
    Builds a list of recipes described in tuples retrieved from the database
    Pass recipe_tuple, makesup_tuple, chef_tuple to build_recipe function to construct the
    recipe object
    '''
    @staticmethod
    def add_to_recipes(recipe_tuple_list, ingredient_tuple_list):
        #return a list of recipe object
        recipes = []
        for recipe_tuple in recipe_tuple_list:
            recipes.append(DaoRecipe.__build_recipe(recipe_tuple, ingredient_tuple_list))
        return recipes


    @staticmethod
    def __build_recipe(recipe_tuple,ingredient_tuple_list):
        #pass in one tuple to __build_recipe to build one recipe object
        #instantiate recipe instance
        recipe_instance = Recipe()
        DaoRecipe.__process_ingredients_info(recipe_tuple, ingredient_tuple_list, recipe_instance)
        DaoRecipe.__process_recipe_info(recipe_tuple, recipe_instance)
        return recipe_instance

    @staticmethod
    def __process_ingredients_info(recipe_tuple, ingredient_tuple_list, recipe_instance):
        ingredients_per_recipe = []
        for ingredient_tuple in ingredient_tuple_list:
            if recipe_tuple[0] in ingredient_tuple[1]:
                ingredients_per_recipe.append(ingredient_tuple)
        for tuple in ingredients_per_recipe:
            recipe_instance.ingredients[tuple[0].rstrip()] = tuple[2]

    @staticmethod
    def __process_recipe_info(recipe_tuple, recipe_instance):
        # the health info was returned as string, changed to int
        recipe_string_to_int = []
        for i in range(2, len(recipe_tuple) - 1):
            recipe_info_str = re.findall('\d+', recipe_tuple[i])
            recipe_info_int = int(recipe_info_str[0])
            recipe_string_to_int.append(recipe_info_int)
        recipe_instance.recipe_id = recipe_tuple[0].rstrip()
        recipe_instance.recipe_name = recipe_tuple[1].rstrip()
        recipe_instance.calories = recipe_string_to_int[0]
        recipe_instance.fat = recipe_string_to_int[1]
        recipe_instance.protein = recipe_string_to_int[2]
        recipe_instance.sodium = recipe_string_to_int[3]
        recipe_instance.sugar = recipe_string_to_int[4]
        recipe_instance.carbs = recipe_string_to_int[5]
        recipe_instance.price = recipe_tuple[8]
