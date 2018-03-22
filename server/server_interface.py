import cx_Oracle
from server.query_factory import QueryFactory
'''
connection = cx_Oracle.connect('cwang9','CWANG9',cx_Oracle.makedsn('oracle.wpi.edu',1521,'ORCL'));
#type in your own username and password
cur = connection.cursor()
#cur.execute('SELECT * FROM ingredient')
cur.execute('SELECT * FROM Employee')
for result in cur:
    print(result)

cur.close()
connection.close()
'''
class Singleton(object):
    _instance = None
    def __new__(cls, *args, **kwargs):
        if not cls._instance:
            cls._instance = super(Singleton, cls).__new__(cls,*args, **kwargs)
        return cls._instance

class ServerInterface(Singleton):
    '''
    def __init__(self):
        self.__connection = cx_Oracle.connect('cwang9', 'CWANG9', cx_Oracle.makedsn('oracle.wpi.edu', 1521, 'ORCL'));
    # type in your own username and password
    '''
    def __init__(self):
        self.__query_factory = QueryFactory()
    def get_recipes(self):
        recipes = []
        try:
            connection = cx_Oracle.connect('cwang9', 'CWANG9', cx_Oracle.makedsn('oracle.wpi.edu', 1521, 'ORCL'));
        except:
            print('Error: Could not connect to database')
        else:
            print('Connected to Oracle successfully')
            cur =connection.cursor()
            cur.execute(self.__query_factory.get_recipes())
            for result in cur:
                recipes.append(result)
            cur.close()
            connection.close()
            print("done")

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
            cur.execute(self.__query_factory.get_ingredients_in_recipe())
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
            cur.execute(self.__query_factory.get_ingredients())
            for result in cur:
                ingredients.append(result)
            cur.close()
            connection.close()
            print("done")
            return ingredients
