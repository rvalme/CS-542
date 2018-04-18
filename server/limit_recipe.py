'''
choose recipe with certain limitation
'''

class Limit_recipe():
    @staticmethod
    def limitrecipe(recipes,quanti,nutri=0):
        if nutri == 3:
            limit_recipe = list(filter(lambda x: x.fat < quanti, recipes))
            return limit_recipe
        elif nutri == 1:
            limit_recipe = list(filter(lambda x: x.carbs < quanti, recipes))
            return limit_recipe
        elif nutri == 5:
            limit_recipe = list(filter(lambda x: x.calories < quanti, recipes))
            return limit_recipe
        elif nutri == 2:
            limit_recipe = list(filter(lambda x: x.sugar < quanti, recipes))
            return limit_recipe
        elif nutri == 4:
            limit_recipe = list(filter(lambda x: x.protein < quanti, recipes))
            return limit_recipe
        elif nutri == 6:
            limit_recipe = list(filter(lambda x: x.sodium < quanti, recipes))
            return limit_recipe
