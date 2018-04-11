'''
    File name: server_interface.py
    Author: Chu Wang
    Date Created: 3/10/2018
    Date last modified: 3/29/2018
    Python Version:3.6
'''
import cx_Oracle
import sys
from server.query_factory import QueryFactory as query_factory
from server.dao_recipe import DaoRecipe as dao_recipe
from server.sort_by import SortBy as sort
from server.limitation_choice import limitchoice

class Singleton(object):
    '''
    Singleton implementation by __new__
    '''
    _instance = None
    def __new__(cls, *args, **kwargs):
        if not cls._instance:
            cls._instance = super(Singleton, cls).__new__(cls)
        return cls._instance

class ServerInterface(Singleton):
    '''
      This class connects with the database by using methods from cx_Oracle
      The data is returned as tuples
      Implemented as Singleton
      '''
    def __init__(self):
        self.__database = 'oracle.wpi.edu'
        self.__username = 'cwang9'
        self.__password = 'CWANG9'



    def get_recipes(self, choice=0):
        recipes = []
        ingredients = []
        chef= []

        try:
            connection = cx_Oracle.connect(self.__username, self.__password, cx_Oracle.makedsn('oracle.wpi.edu', 1521, 'ORCL'));
        except cx_Oracle.DatabaseError as exception:
            self.printf('Failed to connect to %s\n', self.__database)
        else:
            #print('-------Connected to Oracle successfully--------')
            cur =connection.cursor()
            #Customer chooses Vegan
            if choice == 1:
                cur.execute(query_factory.get_vegan_recipes())
                for result in cur:
                    recipes.append(result)
                cur.execute(query_factory.get_vegan_ingredients())
                for result in cur:
                    ingredients.append(result)
            #Customer chooses Vegetarian
            elif choice == 2:
                cur.execute(query_factory.get_vegetarian_recipes())
                for result in cur:
                    recipes.append(result)
                cur.execute(query_factory.get_vegetarian_ingredients())
                for result in cur:
                    ingredients.append(result)
            #Customer chooses Paleo
            elif choice == 3:
                cur.execute(query_factory.get_paleo_recipes())
                for result in cur:
                    recipes.append(result)
                cur.execute(query_factory.get_paleo_ingredients())
                for result in cur:
                    ingredients.append(result)
            #Customer chooses Keto
            #No data, implements later


            #Return the entire list of recipes
            elif choice == 0:
                cur.execute(query_factory.get_recipes())
                for result in cur:
                    recipes.append(result)
                cur.execute(query_factory.get_ingredients_in_recipe())
                for result in cur:
                    ingredients.append(result)


            cur.close()
            connection.close()
            #print("-------Connection closed-------")
            recipes = dao_recipe.add_to_recipes(recipes,ingredients)
            
            return recipes





    def get_ingredient_in_recipe(self):
        ingredients_in_recipes = []
        try:
            connection = cx_Oracle.connect('cwang9', 'CWANG9', cx_Oracle.makedsn('oracle.wpi.edu', 1521, 'ORCL'));
        except:
            print('Error: Could not connect to database')
        else:
            print('Connected to Oracle successfully')
            cur = connection.cursor()
            cur.execute(query_factory.get_ingredients_in_recipe())

            for result in cur:
                ingredients_in_recipes.append(result)
            cur.close()
            connection.close()
            print("done")

            return ingredients_in_recipes

    def get_ingredients(self):
        ingredients = []
        try:
            connection = cx_Oracle.connect('cwang9', 'CWANG9', cx_Oracle.makedsn('oracle.wpi.edu', 1521, 'ORCL'));
        except:
            print('Error: Could not connect to database')
        else:
            print('Connected to Oracle successfully')
            cur = connection.cursor()
            cur.execute(query_factory.get_ingredients())
            for result in cur:
                ingredients.append(result)
            cur.close()
            connection.close()
            print("done")
            return ingredients

    def printf(self, format, *args):
        sys.stdout.write(format % args)

    def printException(self, exception):
        error, = exception.args
        self.printf("Error code = %s\n", error.code)
        self.printf("Error message = %s\n", error.message)


    def sort_by_nutrient(self,choice=0,nutrichoice=0):
        recipe_fat = []
        recipe_calories = []
        recipe_sugar = []
        recipe_protein = []
        try:
            connection = cx_Oracle.connect('cwang9', 'CWANG9', cx_Oracle.makedsn('oracle.wpi.edu', 1521, 'ORCL'));
        except:
            print('Error: Could not connect to database')
        else:
            print('Connected to Oracle successfully')
            cur = connection.cursor()
            if choice == 1:
                if nutrichoice == 1:
                    cur.execute(sort.sort_calories_vegan())
                    for result in cur:
                        recipe_calories.append(result)
                    return recipe_calories
                elif nutrichoice == 2:
                    cur.execute(sort.sort_fat_vegan())
                    for result in cur:
                        recipe_fat.append(result)
                    return recipe_fat
                elif nutrichoice == 3:
                    cur.execute(sort.sort_sugar_vegan())
                    for result in cur:
                        recipe_sugar.append(result)
                    return recipe_sugar
                elif nutrichoice == 4:
                    cur.execute(sort.sort_protein_vegan())
                    for result in cur:
                        recipe_sugar.append(result)
                    return recipe_protein
            elif choice == 2:
                if nutrichoice == 1:
                    cur.execute(sort.sort_calories_vegetarian())
                    for result in cur:
                        recipe_calories.append(result)
                    return recipe_calories
                elif nutrichoice == 2:
                    cur.execute(sort.sort_fat_vegetarian())
                    for result in cur:
                        recipe_fat.append(result)
                    return recipe_fat
                elif nutrichoice == 3:
                    cur.execute(sort.sort_sugar_vegetarian())
                    for result in cur:
                        recipe_sugar.append(result)
                    return recipe_sugar
                elif nutrichoice == 4:
                    cur.execute(sort.sort_protein_vegetarian())
                    for result in cur:
                        recipe_sugar.append(result)
                    return recipe_protein
            elif choice == 3:
                if nutrichoice == 1:
                    cur.execute(sort.sort_calories_paleo())
                    for result in cur:
                        recipe_calories.append(result)
                    return recipe_calories
                elif nutrichoice == 2:
                    cur.execute(sort.sort_fat_paleo())
                    for result in cur:
                        recipe_fat.append(result)
                    return recipe_fat
                elif nutrichoice == 3:
                    cur.execute(sort.sort_sugar_paleo())
                    for result in cur:
                        recipe_sugar.append(result)
                    return recipe_sugar
                elif nutrichoice == 4:
                    cur.execute(sort.sort_protein_paleo())
                    for result in cur:
                        recipe_sugar.append(result)
                    return recipe_protein

    def select_exclude(self,choice, ingred):
        exclude = []
        try:
            connection = cx_Oracle.connect('cwang9', 'CWANG9', cx_Oracle.makedsn('oracle.wpi.edu', 1521, 'ORCL'));
        except:
            print('Error: Could not connect to database')
        else:
            print('Connected to Oracle successfully')
            cur = connection.cursor()
            if choice == 1:
                cur.execute(limitchoice.exclude_ingredient_vegan(ingred))
                for result in cur:
                    exclude.append(result)
                return exclude
            elif choice == 2:
                cur.execute(limitchoice.exclude_ingredient_vegetarian(ingred))
                for result in cur:
                    exclude.append(result)
                return exclude
            elif choice == 3:
                cur.execute(limitchoice.exclude_ingredient_paleo(ingred))
                for result in cur:
                    exclude.append(result)
                return exclude



'''
    def select_limitation(self,choice,nutrichoice, quant):
        recipe_fat = []
        recipe_calories = []
        recipe_sugar = []
        recipe_protein = []
        try:
            connection = cx_Oracle.connect('cwang9', 'CWANG9', cx_Oracle.makedsn('oracle.wpi.edu', 1521, 'ORCL'));
        except:
            print('Error: Could not connect to database')
        else:
            print('Connected to Oracle successfully')
            cur = connection.cursor()
            if choice == 1:
                if nutrichoice == 1:
                    cur.execute(limitchoice.nutrient_limit_vegan_calories(quant))
                    for result in cur:
                        recipe_calories.append(result)
                    return recipe_calories
                elif nutrichoice == 2:
                    cur.execute(limitchoice.nutrient_limit_vegan_fat(quant))
                    for result in cur:
                        recipe_fat.append(result)
                    return recipe_fat
                elif nutrichoice == 3:
                    cur.execute(limitchoice.nutrient_limit_vegan_sugar(quant))
                    for result in cur:
                        recipe_sugar.append(result)
                    return recipe_sugar
                elif nutrichoice == 4:
                    cur.execute(limitchoice.nutrient_limit_vegan_protein(quant))
                    for result in cur:
                        recipe_sugar.append(result)
                    return recipe_protein
            elif choice == 2:
                if nutrichoice == 1:
                    cur.execute(limitchoice.nutrient_limit_vegetarian_calories(quant))
                    for result in cur:
                        recipe_calories.append(result)
                    return recipe_calories
                elif nutrichoice == 2:
                    cur.execute(limitchoice.nutrient_limit_vegetarian_fat(quant))
                    for result in cur:
                        recipe_fat.append(result)
                    return recipe_fat
                elif nutrichoice == 3:
                    cur.execute(limitchoice.nutrient_limit_vegetarian_sugar(quant))
                    for result in cur:
                        recipe_sugar.append(result)
                    return recipe_sugar
                elif nutrichoice == 4:
                    cur.execute(limitchoice.nutrient_limit_vegetarian_protein(quant))
                    for result in cur:
                        recipe_sugar.append(result)
                    return recipe_protein
            elif choice == 3:
                if nutrichoice == 1:
                    cur.execute(limitchoice.nutrient_limit_paleo_calories(quant))
                    for result in cur:
                        recipe_calories.append(result)
                    return recipe_calories
                elif nutrichoice == 2:
                    cur.execute(limitchoice.nutrient_limit_paleo_fat(quant))
                    for result in cur:
                        recipe_fat.append(result)
                    return recipe_fat
                elif nutrichoice == 3:
                    cur.execute(limitchoice.nutrient_limit_paleo_sugar(quant))
                    for result in cur:
                        recipe_sugar.append(result)
                    return recipe_sugar
                elif nutrichoice == 4:
                    cur.execute(limitchoice.nutrient_limit_paleo_protein(quant))
                    for result in cur:
                        recipe_sugar.append(result)
                    return recipe_protein
'''





