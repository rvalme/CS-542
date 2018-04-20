'''
    File name: server_interface.py
    Author: Chu Wang, Rom Valme
    Date Created: 3/10/2018
    Date last modified: 3/29/2018
    Python Version:3.6
'''
import cx_Oracle
import sys
from server.query_factory import QueryFactory as query_factory
from server.dao_recipe import DaoRecipe as dao_recipe
from server.limitation_choice import limitchoice

from recipe.recipe import Recipe


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
        #self.__username = 'cwang9'
        #self.__password = 'CWANG9'

        #self.__username = 'hwang10'
        #self.__password = 'HWANG10'

    '''
    def make_tuple(self,tuples,row,column):
        array = []
        for i in range (row):
            for j in range (column):
                array[i].append(tuples[i+j])
        return array
    '''

    def update_order(self):
        try:
            connection = cx_Oracle.connect(self.__username, self.__password, cx_Oracle.makedsn('oracle.wpi.edu', 1521, 'ORCL'));
        except cx_Oracle.DatabaseError as exception:
            self.printf('Failed to connect to %s\n', self.__database)
        else:
            #print('-------Connected to Oracle successfully--------')


            cur = connection.cursor()
            statement = "update Ingredient I set I.quantity = (I.quantity - :1) where I.iname = 'Carrot'"
            #cur.executemany("INSERT INTO CanRequest(RID, CID, Quantity) VALUES (:1, :2, :3)", recipe_requests)
            cur.execute(statement, (1, ))
            connection.commit()
            cur.close()
            connection.close()


    def insert_order(self, recipe_requests, recipe_id, customer_id, quantities):
        '''
        This function inserts an order into the CanRequest table
        showing that the customer has made an
        an order request
        recipe_request is a list of tuples
        '''
        try:
            connection = cx_Oracle.connect(self.__username, self.__password, cx_Oracle.makedsn('oracle.wpi.edu', 1521, 'ORCL'));
            connection.begin()
            cur = connection.cursor()
            # Execute a list of sql because cx_oracle will only take 1 parameter
            self.decrement_ingrd(recipe_id, cur, quantities)
            # self.update_customer(customer_id)
            cur.execute("SELECT * FROM Customer C where C.CID = '" + customer_id + "'")
            result = cur.fetchall()
            if len(result) == 0:
                cur.execute("INSERT INTO Customer(CID) VALUES (:q)", q=customer_id)
            cur.executemany("INSERT INTO CanRequest(RID, CID, Quantity) VALUES (:1, :2, :3)", recipe_requests)
            connection.commit()
        except cx_Oracle.DatabaseError as e:
            error, = e.args
            # roll back the transaction
            connection.rollback()
            print(sys.stderr, "Oracle-Error-Code:", error.code)
            print(sys.stderr, "Oracle-Error-Message:", error.message)
        finally:
            #Close cursor and connection
            cur.close()
            connection.close()

    def get_rid(self, rname):
        try:
            connection = cx_Oracle.connect(self.__username, self.__password, cx_Oracle.makedsn('oracle.wpi.edu', 1521, 'ORCL'));
        except cx_Oracle.DatabaseError as exception:
            self.printf('Failed to connect to %s\n', self.__database)
        else:
            cur =connection.cursor()
            cur.execute("SELECT R.RID FROM Recipe R WHERE R.RNAME = '" + rname + "'")
            rid = cur.fetchall()[0][0].strip();
            cur.close()
            connection.close()
            return rid

    def get_recipe(self, rname):
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
            cur.execute("SELECT * FROM Recipe R WHERE R.RNAME = '" + rname + "'")
            recipe = cur.fetchall()[0];
            cur.execute("SELECT * FROM MakesUp M WHERE M.RID IN \
                           (SELECT R.RID FROM Recipe R WHERE R.RNAME = '" + rname + "')")
            for result in cur.fetchall():
                ingredients.append(result);

            cur.execute(query_factory.get_chef_info())
            chef = cur.fetchall()
            cur.close()
            connection.close()
            #print("-------Connection closed-------")
            r_out = dao_recipe.build_recipe(recipe, ingredients, chef)
            return r_out

    def decrement_ingrd(self,recipe_id, cur, quantity):
        ingrd_tuples = []
        sql_list = []

        cur.execute("SELECT INAME, AMOUNT FROM MAKESUP WHERE RID = '" + recipe_id + "'")
        ingrd_tuples = cur.fetchall()
        for i in range(len(ingrd_tuples)):
            update_sql = "UPDATE Ingredient I SET I.QUANTITY = I.QUANTITY - :q WHERE I.INAME ='" + ingrd_tuples[i][0].rstrip() + "'"
            decre_amt = float(ingrd_tuples[i][1]) * int(quantity)
            cur.execute(update_sql, q=decre_amt)


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
                recipes = cur.fetchall()

                cur.execute(query_factory.get_vegan_ingredients())
                ingredients = cur.fetchall()

                cur.execute(query_factory.get_chef_info())
                chef = cur.fetchall()

            #Customer chooses Vegetarian
            elif choice == 2:
                cur.execute(query_factory.get_vegetarian_recipes())
                recipes = cur.fetchall()

                cur.execute(query_factory.get_vegetarian_ingredients())
                ingredients = cur.fetchall()

                cur.execute(query_factory.get_chef_info())
                chef = cur.fetchall()

            #Customer chooses Paleo
            elif choice == 3:
                cur.execute(query_factory.get_paleo_recipes())
                recipes =cur.fetchall()

                cur.execute(query_factory.get_paleo_ingredients())
                ingredients = cur.fetchall()

                cur.execute(query_factory.get_chef_info())
                chef = cur.fetchall()

            #Customer chooses Keto
            elif choice == 4:
                cur.execute(query_factory.get_keto_recipes())
                recipes = cur.fetchall()

                cur.execute(query_factory.get_keto_ingredients())
                ingredients = cur.fetchall()

                cur.execute(query_factory.get_chef_info())
                chef = cur.fetchall()



            #Return the entire list of recipes
            elif choice == 0:
                cur.execute(query_factory.get_recipes())
                recipes = cur.fetchall()

                cur.execute(query_factory.get_ingredients_in_recipe())
                ingredients = cur.fetchall()

                cur.execute(query_factory.get_chef_info())
                chef = cur.fetchall()

            cur.close()
            connection.close()
            #print("-------Connection closed-------")

            recipes = dao_recipe.add_to_recipes(recipes,ingredients,chef)
            return recipes


    def get_ingredient_in_recipe(self):
        ingredients_in_recipes = []
        try:
            connection = cx_Oracle.connect(self.__username, self.__password, cx_Oracle.makedsn('oracle.wpi.edu', 1521, 'ORCL'));
        except:
            print('Error: Could not connect to database')
        else:
            print('Connected to Oracle successfully')
            cur = connection.cursor()
            cur.execute(query_factory.get_ingredients_in_recipe())
            ingredients_in_recipes = cur.fetchall()
            cur.close()
            connection.close()
            print("done")

            return ingredients_in_recipes

    def get_ingredients(self):
        ingredients = []
        try:
            connection = cx_Oracle.connect(self.__username, self.__password, cx_Oracle.makedsn('oracle.wpi.edu', 1521, 'ORCL'));
        except:
            print('Error: Could not connect to database')
        else:
            print('Connected to Oracle successfully')
            cur = connection.cursor()
            cur.execute(query_factory.get_ingredients())
            ingredients = cur.fetchall()
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



    def select_exclude(self,choice, ingred):
        exclude = []
        ingredient = []
        chef = []
        try:
            connection = cx_Oracle.connect(self.__username, self.__password, cx_Oracle.makedsn('oracle.wpi.edu', 1521, 'ORCL'));
        except:
            print('Error: Could not connect to database')
        else:
            print('Connected to Oracle successfully')
            cur = connection.cursor()
            if choice == 1:

                cur.execute(limitchoice.exclude_ingredient_vegan(ingred))
                exclude = cur.fetchall()

                cur.execute(limitchoice.ingredient_exclude_vegan(ingred))
                ingredient = cur.fetchall()

                cur.execute(query_factory.get_chef_info())
                chef = cur.fetchall()
                #return exclude
            elif choice == 2:
                cur.execute(limitchoice.exclude_ingredient_vegetarian(ingred))
                exclude = cur.fetchall()

                cur.execute(limitchoice.ingredient_exclude_vegetarian(ingred))
                ingredient = cur.fetchall()

                cur.execute(query_factory.get_chef_info())
                chef = cur.fetchall()
                #return exclude
            elif choice == 3:
                cur.execute(limitchoice.exclude_ingredient_paleo(ingred))
                exclude = cur.fetchall()

                cur.execute(limitchoice.ingredient_exclude_paleo(ingred))
                ingredient = cur.fetchall()

                cur.execute(query_factory.get_chef_info())
                chef = cur.fetchall()

            elif choice == 4:
                cur.execute(limitchoice.exclude_ingredient_keto(ingred))
                exclude = cur.fetchall()

                cur.execute(limitchoice.ingredient_exclude_keto(ingred))
                ingredient = cur.fetchall()

                cur.execute(query_factory.get_chef_info())
                chef = cur.fetchall()
            cur.close()
            connection.close()
            exclude = dao_recipe.add_to_recipes(exclude,ingredient,chef)
            return exclude







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
