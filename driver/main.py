'''
    File name: main.py
    Author: Chu Wang
    Date Created: 3/10/2018
    Date last modified: 3/23/2018
    Python Version:3.6
'''
from recipe.recipe import Recipe
from server.server_interface import ServerInterface
from server.dao_recipe import DaoRecipe
import itertools


def main():
    '''
    Entry point for CS542 code
    The main function will retrieve the list of recipes of a particular diet from the
    database and print the list in the console
    '''

    server_interface=ServerInterface()

    #ingredients_of_recipe = server_interface.get_ingredient_in_recipe()
    #print(ingredients_of_recipe)

    recipes = server_interface.get_recipes(choice=0)
    print(recipes)








    #recipes_instance = dao.build_recipe(recipes[0])
    #print(recipes_instance)

    #vegetarian_recipes = server_interface.get_vegetarian_recipes()
    #print(vegetarian_recipes)

    #ingredients = server_interface.get_ingredients()
    #print(ingredients)
if __name__ == "__main__":
    main()