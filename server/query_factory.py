'''
    File name: query_factory.py
    Author: Chu Wang
    Date Created: 3/10/2018
    Date last modified: 3/22/2018
    Python Version:3.6
'''
class QueryFactory:
    def __init__(self):
        pass
    def get_recipes(self):
        return 'SELECT * FROM recipe'

    def get_ingredients_in_recipe(self):
        return 'SELECT * FROM MakesUp'

    def get_ingredients(self):
        return 'SELECT * FROM Ingredient'