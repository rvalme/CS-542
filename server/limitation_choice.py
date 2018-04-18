'''
choose recipe exclude certain ingredients
choose recipe with some limitations
'''


class limitchoice():
    @staticmethod
    def exclude_ingredient_vegan(ingred):
        a = "SELECT * FROM Recipe R \
                        Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                        WHERE S.Type_of_diet = 'Vegan' ) MINUS SELECT * FROM Recipe R \
                        Where R.RID IN (SELECT M.RID FROM MAKESUP M WHERE M.INAME ="
        d = ") AND R.RID IN (SELECT M.RID FROM MAKESUP M WHERE M.INAME ="
        e = str(ingred)
        f = ")"
        return a  + e + f

    @staticmethod
    def exclude_ingredient_vegetarian(ingred):
        a = "SELECT * FROM Recipe R \
                        Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                        WHERE S.Type_of_diet = 'Vegetarian' "

        c = ") MINUS SELECT * FROM Recipe R \
                        Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                        WHERE S.Type_of_diet ='Vegetarian'"
        d = ") AND R.RID IN (SELECT M.RID FROM MAKESUP M WHERE M.INAME ="
        e = str(ingred)
        f = ")"
        return a + c  + d + e + f

    @staticmethod
    def exclude_ingredient_paleo(ingred):
        a = "SELECT * FROM Recipe R \
                        Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                        WHERE S.Type_of_diet = 'Paleolithic'"

        c = ") MINUS SELECT * FROM Recipe R \
                        Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                        WHERE S.Type_of_diet ='Paleolithic'"
        d = ") AND R.RID IN (SELECT M.RID FROM MAKESUP M WHERE M.INAME ="
        e = str(ingred)
        f = ")"
        return a + c  + d + e + f

    @staticmethod
    def exclude_ingredient_keto(ingred):
        a = "SELECT * FROM Recipe R \
                        Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                        WHERE S.Type_of_diet = 'Ketogenic'"

        c = ") MINUS SELECT * FROM Recipe R \
                        Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                        WHERE S.Type_of_diet ='Ketogenic'"
        d = ") AND R.RID IN (SELECT M.RID FROM MAKESUP M WHERE M.INAME ="
        e = str(ingred)
        f = ")"
        return a + c  + d + e + f

    @staticmethod
    def ingredient_exclude_vegan(ingred):
        a = "SELECT * FROM MakesUp M \
                        Where M.RID IN (SELECT S.RID FROM SubscribesTo S \
                        WHERE S.Type_of_diet = 'Vegan' ) AND \
                        M.RID NOT IN (SELECT M.RID FROM MAKESUP M WHERE M.INAME ="
        e = str(ingred)
        f = ")"
        return a  + e + f

    @staticmethod
    def ingredient_exclude_vegetarian(ingred):
        a = "SELECT * FROM MakesUp M \
                        Where M.RID IN (SELECT S.RID FROM SubscribesTo S \
                        WHERE S.Type_of_diet = 'Vegetarian' ) AND \
                        M.RID NOT IN (SELECT M.RID FROM MAKESUP M WHERE M.INAME ="
        e = str(ingred)
        f = ")"
        return a  + e + f

    @staticmethod
    def ingredient_exclude_keto(ingred):
        a = "SELECT * FROM MakesUp M \
                        Where M.RID IN (SELECT S.RID FROM SubscribesTo S \
                        WHERE S.Type_of_diet = 'Ketogenic' ) AND \
                        M.RID NOT IN (SELECT M.RID FROM MAKESUP M WHERE M.INAME ="
        e = str(ingred)
        f = ")"
        return a  + e + f

    @staticmethod
    def ingredient_exclude_paleo(ingred):
        a = "SELECT * FROM MakesUp M \
                        Where M.RID IN (SELECT S.RID FROM SubscribesTo S \
                        WHERE S.Type_of_diet = 'Paleolithic' ) AND \
                        M.RID NOT IN (SELECT M.RID FROM MAKESUP M WHERE M.INAME ="
        e = str(ingred)
        f = ")"
        return a  + e + f















    @staticmethod
    def nutrient_limit_vegan_calories(quant):
        a = "SELECT * FROM Recipe R \
                Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                WHERE S.Type_of_diet = 'Vegan') AND R.Calories<"
        g = str(quant)
        return a+g

    @staticmethod
    def nutrient_limit_vegan_fat(quant):
        a = "SELECT * FROM Recipe R \
                Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                WHERE S.Type_of_diet = 'Vegan') AND R.FAT<"
        g = str(quant)
        return a+g

    @staticmethod
    def nutrient_limit_vegan_sugar(quant):
        a = "SELECT * FROM Recipe R \
                Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                WHERE S.Type_of_diet = 'Vegan') AND R.Sugar<"
        g = str(quant)
        return a+g

    @staticmethod
    def nutrient_limit_vegan_protein(quant):
        a = "SELECT * FROM Recipe R \
                Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                WHERE S.Type_of_diet = 'Vegan') AND R.Protein<"
        g = str(quant)
        return a+g

    @staticmethod
    def nutrient_limit_vegetarian_calories(quant):
        a = "SELECT * FROM Recipe R \
                Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                WHERE S.Type_of_diet = 'Vegetarian') AND R.Calories<"
        g = str(quant)
        return a+g

    @staticmethod
    def nutrient_limit_vegetarian_fat(quant):
        a = "SELECT * FROM Recipe R \
                Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                WHERE S.Type_of_diet = 'Vegetarian') AND R.Fat<"
        g = str(quant)
        return a+g

    @staticmethod
    def nutrient_limit_vegetarian_sugar(quant):
        a = "SELECT * FROM Recipe R \
                Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                WHERE S.Type_of_diet = 'Vegetarian') AND R.Sugar<"
        g = str(quant)
        return a+g

    @staticmethod
    def nutrient_limit_vegetarian_protein(quant):
        a = "SELECT * FROM Recipe R \
                Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                WHERE S.Type_of_diet = 'Vegetarian') AND R.Protein<"
        g = str(quant)
        return a+g

    @staticmethod
    def nutrient_limit_paleo_calories(quant):
        a = "SELECT * FROM Recipe R \
                Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                WHERE S.Type_of_diet = 'Paleolithic') AND R.Calories<"
        g = str(quant)
        return a + g

    @staticmethod
    def nutrient_limit_paleo_fat(quant):
        a = "SELECT * FROM Recipe R \
                Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                WHERE S.Type_of_diet = 'Paleolithic') AND R.Fat<"
        g = str(quant)
        return a + g

    @staticmethod
    def nutrient_limit_paleo_sugar(quant):
        a = "SELECT * FROM Recipe R \
                Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                WHERE S.Type_of_diet = 'Paleolithic') AND R.Sugar<"
        g = str(quant)
        return a + g

    @staticmethod
    def nutrient_limit_paleo_protein(quant):
        a = "SELECT * FROM Recipe R \
                Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                WHERE S.Type_of_diet = 'Paleolithic') AND R.Protein<"
        g = str(quant)
        return a + g


