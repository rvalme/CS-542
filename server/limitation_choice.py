'''
choose recipe exclude certain ingredients
choose recipe with some limitations
'''


class limitchoice():
    @staticmethod
    def exclude_ingredient(type,ingred):
        a = "SELECT R.RNAME FROM Recipe R \
                        Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                        WHERE S.Type_of_diet = "

        b = str(type)
        c = ") MINUS SELECT R.RNAME FROM Recipe R \
                        Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                        WHERE S.Type_of_diet ="
        d = ") AND R.RID IN (SELECT M.RID FROM MAKESUP M WHERE M.INAME ="
        e = str(ingred)
        f = ")"
        return a + b + c + b + d + e + f

    @staticmethod
    def nutrient_limit(type,nutri,quant):
        a = "SELECT R."
        b = str(nutri)
        c = ",R.RNAME FROM Recipe R \
                Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                WHERE S.Type_of_diet = "
        d = str(type)
        e = ")AND R."
        f = "<"
        g = str(quant)
        return a+b+c+d+e+b+f+g

