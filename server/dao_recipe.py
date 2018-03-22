'''
    File name: dao_recipe.py
    Author: Chu Wang
    Date Created: 3/21/2018
    Date last modified: 3/22/2018
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
    def __init__(self):
        pass

    def add_all(self, recipe_list):
        for i in range(len(recipe_list)):
            recipes = recipe_list[i]
            #single_recipe=build_recipe(recipes)

    def add_recipe(self,recipe_list):
        pass

    def build_recipe(self, recipe_tuple, makesup_tuple):
        #the health info was returned as string, changed to int
        recipe_instance = Recipe()
        ingredients_in_recipe=[]
        #for i in range(len(makesup_tuple)):


        recipe_list=[]
        for i in range(2,len(recipe_tuple)):
            recipe_info_str = re.findall('\d+', recipe_tuple[i])
            recipe_info_int = int(recipe_info_str[0])
            recipe_list.append(recipe_info_int)
        #needs reform later
        recipe_instance.recipe_id = recipe_tuple[0]
        recipe_instance.recipe_name = recipe_tuple[1]
        recipe_instance.calories = recipe_list[0]
        recipe_instance.fat = recipe_list[1]
        recipe_instance.protein = recipe_list[2]
        recipe_instance.sodium = recipe_list[3]
        recipe_instance.sugar = recipe_list[4]
        recipe_instance.carbs = recipe_list[5]
        return recipe_instance

