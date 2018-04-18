'''
    File name: main.py
    Authors: Chu Wang, Rom Valme
    Date Created: 3/10/2018
    Date last modified: 3/29/2018
    Python Version:3.6
'''
from recipe.recipe import Recipe
from server.server_interface import ServerInterface
from server.dao_recipe import DaoRecipe
import itertools
from order.customer_order import Order
import random
import operator
from server.sort_recipe import Sort_recipe
from server.limit_recipe import Limit_recipe



def main():
    '''
    Entry point for CS542 code
    The main function will retrieve the list of recipes of a particular diet from the
    database and print the list in the console
    '''
    server_interface=ServerInterface()
    log_in = True
    Keep_ordering = True
    while log_in:

        print('Vegan = 1, Vegetarian = 2, Paleo = 3,Keto = 4, All = 0\n')
        diet_number = int(input('Enter a diet number or -1 to exit\n'))
        if not (0 <= diet_number <= 4 or diet_number == -1):
            print('Invalid input')
        elif diet_number == -1:
            print("Order finished")
            log_in = False
        else:
            recipes = server_interface.get_recipes(choice=diet_number)
            print(recipes)
            customer_id = "C0" + str(random.randrange(1, 100))  # TODO Determine the method of iding customer (random, sequential)
            print('Choose a nutrient type to sort recipes:\n')
            print('Carbs = 1,sugar = 2,fat = 3, Protein = 4, Calories = 5, Sodium = 6')

            nutrientnumber = int(input())
            sortrecipe = Sort_recipe.sortrecipe(recipes=recipes, nutri=nutrientnumber)
            print(sortrecipe)

            print('Select recipe exclude certain ingredients:')
            ingredi = input()
            excludeingred = server_interface.select_exclude(choice=diet_number, ingred=ingredi)
            print(excludeingred)

            print('Choose recipe with nutrient limit:')
            quant = float(input())
            limitrecipe = Limit_recipe.limitrecipe(recipes=recipes, nutri=nutrientnumber, quanti=quant)
            print(limitrecipe)

            ordr = Order()
            ordr.order_recipe(customer_id, server_interface, recipes)


        #give customer an id and ask them what recipe they want
        #update db based on recipe request

if __name__ == "__main__":
    main()