'''
choose recipe with certain limitation
'''

class Limit_recipe():
    @staticmethod
    def limitrecipe(recipes,nutrient,quanti):
        limit_recipe = list(filter(lambda x:x[nutrient] < quanti,recipes))
        return limit_recipe
