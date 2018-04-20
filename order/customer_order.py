'''
    File name: customer_order.py
    Authors: Chu Wang, Rom Valme
    Date Created: 3/29/2018
    Date last modified: 3/29/2018
    Python Version:3.6
'''

from server.server_interface import ServerInterface

class Order:

    def order_meal(self):
        return 0


    def order_recipe(self, customer_id, server_interface):

        print('Your customer id is %s' % customer_id)
        recipe_ids_str = input('Choose your desired recipes (e.g. R01, R02, R03)\n')
        quantities_str = input('Choose your desired quantity for each recipe correspondingly (e.g. 1, 2, 3)\n')
        recipe_ids = [x.strip() for x in recipe_ids_str.split(',')]
        quantities = [x.strip() for x in quantities_str.split(',')]
        recipe_requests = [(recipe, customer_id, quantities[ind]) for ind, recipe in enumerate(recipe_ids)]
        server_interface.insert_order(recipe_requests, recipe_ids[0], customer_id, quantities[0])

