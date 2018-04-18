'''
    File name: dao_recipe.py
    Author: Chu Wang
    Date Created: 3/21/2018
    Date last modified: 3/29/2018
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
    def add_to_recipes(recipe_tuple_list, ingredient_tuple_list, chef_tuple_list):
        #return a list of recipe object
        recipes = []
        for recipe_tuple in recipe_tuple_list:
            recipes.append(DaoRecipe.__build_recipe(recipe_tuple, ingredient_tuple_list, chef_tuple_list))
        return recipes


    @staticmethod

    def __build_recipe(recipe_tuple,ingredient_tuple_list, chef_tuple_list):
        #pass in one tuple to __build_recipe to build one recipe object
        #instantiate recipe instance
        recipe_instance = Recipe()
        DaoRecipe.__process_ingredients_info(recipe_tuple, ingredient_tuple_list, recipe_instance)
        DaoRecipe.__process_recipe_info(recipe_tuple, recipe_instance)
        DaoRecipe.__process_chef_info(recipe_tuple, chef_tuple_list, recipe_instance)

        return recipe_instance


    @staticmethod
    def __process_ingredients_info(recipe_tuple, ingredient_tuple_list, recipe_instance):
        ingred_indexes = [i for i, v in enumerate(ingredient_tuple_list) if v[1] == recipe_tuple[0]]
        for ingred_index in ingred_indexes:
            recipe_instance.ingredients[ingredient_tuple_list[ingred_index][0].rstrip()]\
                = ingredient_tuple_list[ingred_index][2]


    @staticmethod
    def __process_recipe_info(recipe_tuple, recipe_instance):
        # the health info was returned as string, changed to int
        #recipe_float_to_int = []

        recipe_instance.recipe_id = recipe_tuple[0].rstrip()
        recipe_instance.recipe_name = recipe_tuple[1].rstrip()
        recipe_instance.calories = recipe_tuple[6]
        recipe_instance.fat = recipe_tuple[4]
        recipe_instance.protein = recipe_tuple[5]
        recipe_instance.sodium = recipe_tuple[7]
        recipe_instance.sugar = recipe_tuple[3]
        recipe_instance.carbs = recipe_tuple[2]
        recipe_instance.price = recipe_tuple[8]

    @staticmethod
    def __process_chef_info(recipe_tuple, chef_tuple_list, recipe_instance):
        tuple_indexes = [i for i, v in enumerate(chef_tuple_list) if v[0] == recipe_tuple[0]]
        recipe_instance.chef = chef_tuple_list[tuple_indexes[0]][1]
