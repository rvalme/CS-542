'''
    sortby nutrient
'''
class SortBy():
    #pass
    @staticmethod
    def sort_calories_paleo():
        return "SELECT * FROM Recipe R \
                Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                WHERE S.Type_of_diet = 'Paleolithic') ORDER BY R.Calories desc"

    @staticmethod
    def sort_calories_vegan():
        return "SELECT * FROM Recipe R \
                Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                WHERE S.Type_of_diet = 'Vegan') ORDER BY R.Calories desc"

    @staticmethod
    def sort_calories_vegetarian():
        return "SELECT * FROM Recipe R \
                Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                WHERE S.Type_of_diet = 'Vegetarian') ORDER BY R.Calories desc"

    @staticmethod
    def sort_fat_paleo():
        return "SELECT * FROM Recipe R \
                Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                WHERE S.Type_of_diet = 'Paleolithic') ORDER BY R.Fat desc"

    @staticmethod
    def sort_fat_vegan():
        return "SELECT * FROM Recipe R \
                Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                WHERE S.Type_of_diet = 'Vegan') ORDER BY R.Fat desc"

    @staticmethod
    def sort_fat_vegetarian():
        return "SELECT * FROM Recipe R \
                Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                WHERE S.Type_of_diet = 'Vegetarian') ORDER BY R.Fat desc"

    @staticmethod
    def sort_protein_paleo():
        return "SELECT * FROM Recipe R \
                Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                WHERE S.Type_of_diet = 'Paleolithic') ORDER BY R.Protein desc"

    @staticmethod
    def sort_protein_vegan():
        return "SELECT * FROM Recipe R \
                Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                WHERE S.Type_of_diet = 'Vegan') ORDER BY R.Protein desc"

    @staticmethod
    def sort_protein_vegetarian():
        return "SELECT * FROM Recipe R \
                Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                WHERE S.Type_of_diet = 'Vegetarian') ORDER BY R.Protein desc"

    @staticmethod
    def sort_sugar_paleo():
        return "SELECT * FROM Recipe R \
                Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                WHERE S.Type_of_diet = 'Paleolithic') ORDER BY R.Sugar desc"

    @staticmethod
    def sort_sugar_vegan():
        return "SELECT * FROM Recipe R \
                Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                WHERE S.Type_of_diet = 'Vegan') ORDER BY R.Sugar desc"

    @staticmethod
    def sort_sugar_vegetarian():
        return "SELECT * FROM Recipe R \
                Where R.RID IN (SELECT S.RID FROM SubscribesTo S \
                WHERE S.Type_of_diet = 'Vegetarian') ORDER BY R.Sugar desc"