'''
Sort recipes by certain ingredients
'''

class Sort_recipe():
    @staticmethod
    def sortreicpe(recipes,nutri):
        sort_recipes = sorted(recipes,key=recipes[nutri])
        return sort_recipes