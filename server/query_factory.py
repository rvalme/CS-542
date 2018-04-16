'''
    File name: query_factory.py
    Author: Chu Wang
    Date Created: 3/10/2018
    Date last modified: 3/23/2018
    Python Version:3.6
'''
class QueryFactory:
    @staticmethod
    def get_recipes():
        return "SELECT * FROM recipe"

    @staticmethod
    def get_ingredients_in_recipe():
        return "SELECT * FROM MakesUp"

    @staticmethod
    def get_ingredients():
        return "SELECT * FROM Ingredient"

    @staticmethod
    def get_vegetarian_recipes():
        return " SELECT * FROM Recipe R WHERE R.RID IN (SELECT S.RID FROM SubscribesTo S \
                WHERE S.Type_of_diet = 'Vegetarian')"

    @staticmethod
    def get_vegan_recipes():
        return "SELECT * FROM Recipe R WHERE R.RID IN \
        (SELECT S.RID FROM SubscribesTo S WHERE S.Type_of_diet = 'Vegan')"

    @staticmethod
    def get_paleo_recipes():
        return "SELECT * FROM Recipe R WHERE R.RID IN \
        (SELECT S.RID FROM SubscribesTo S WHERE S.Type_of_diet = 'Paleolithic')"

    @staticmethod
    def get_keto_recipes():
        return "SELECT * FROM Recipe R WHERE R.RID IN \
        (SELECT S.RID FROM SubscribesTo S WHERE S.Type_of_diet = 'Ketogenic')"

    @staticmethod
    def get_vegan_ingredients():
        return "SELECT * FROM MakesUp M WHERE M.RID IN  \
               (SELECT S.RID FROM SubscribesTo S WHERE S.Type_of_diet = 'Vegan')"

    @staticmethod
    def get_vegetarian_ingredients():
        return "SELECT * FROM MakesUp M WHERE M.RID IN \
               (SELECT S.RID FROM SubscribesTo S WHERE S.Type_of_diet = 'Vegetarian')"

    @staticmethod
    def get_paleo_ingredients():
        return "SELECT * FROM MakesUp M WHERE M.RID IN \
               (SELECT S.RID FROM SubscribesTo S WHERE S.Type_of_diet = 'Paleolithic')"

    @staticmethod
    def get_keto_ingredients():
        return "SELECT * FROM MakesUp M WHERE M.RID IN \
               (SELECT S.RID FROM SubscribesTO S WHERE S.Type_of_diet = 'Ketogenic')"


    @staticmethod
    def get_chef_info():
       return "SELECT * FROM MakesInstanceof"

    @staticmethod
    def update_ingrd_table(ingrd, qty):
        a= "UPDATE Ingredient I SET I.QUANTITY = C.QUANTITY - "
        b= str(qty)
        c= "WHERE I.INAME ="
        d= str(ingrd)
        return a+b+c+d



