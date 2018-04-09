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
from order.customer_order import Order
import itertools


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
        print('Vegan = 1, Vegetarian = 2, Paleo = 3, All = 0\n')
        diet_number = int(input('Enter a diet number or -1 to exit\n'))
        if not (0 <= diet_number <= 3 or diet_number == -1):
            print('Invalid input')
        elif diet_number == -1:
            print("Order finished")
            log_in = False
        else:
            customer_id = "C01" #TODO Determine the method of iding customer (random, sequential)
            recipes = server_interface.get_recipes(choice=diet_number)
            print(recipes)
            ordr = Order()
            ordr.order_recipe(customer_id, server_interface)


        #give customer an id and ask them what recipe they want
        #update db based on recipe request


if __name__ == "__main__":
    main()
