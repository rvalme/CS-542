'''
    File name: query_factory.py
    Author: Chu Wang
    Date Created: 3/10/2018
    Date last modified: 3/23/2018
    Python Version:3.6
'''
class QueryFactory:
    @classmethod
    def get_recipes(cls):
        return 'SELECT * FROM recipe'

    @classmethod
    def get_ingredients_in_recipe(cls):
        return 'SELECT * FROM Makesup'

    @classmethod
    def get_ingredients(cls):
        return 'SELECT * FROM Ingredient'
