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
        self.__username = 'rsvalme'
        self.__password = 'RSVALME'



    def get_recipes(self, choice=0):
        recipes = []
        ingredients = []
        chef= []

        try:
            import pdb;pdb.set_trace()
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
            connection = cx_Oracle.connect('rsvalme', 'RSVALME', cx_Oracle.makedsn('oracle.wpi.edu', 1521, 'ORCL'));
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
            connection = cx_Oracle.connect('rsvalme', 'RSVALME', cx_Oracle.makedsn('oracle.wpi.edu', 1521, 'ORCL'));
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



'''
connection = cx_Oracle.connect('rsvalme','RSVALME',cx_Oracle.makedsn('oracle.wpi.edu',1521,'ORCL'));
#type in your own username and password
cur = connection.cursor()
cur.execute()
#cur.execute('SELECT * FROM MakesUp')
for result in cur:
    print(result)

cur.close()
connection.close()
'''
