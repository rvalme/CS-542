'''
Sort recipes by certain ingredients
'''

class Sort_recipe():
    @staticmethod
    def sortrecipe(recipes,nutri=0):
        if nutri == 3:
            sort_recipes = sorted(recipes, key=lambda recipes: recipes.fat, reverse=True)
            return sort_recipes
        elif nutri == 1:
            sort_recipes = sorted(recipes, key=lambda recipes: recipes.carbs, reverse=True)
            return sort_recipes
        elif nutri == 5:
            sort_recipes = sorted(recipes, key=lambda recipes: recipes.calories, reverse=True)
            return sort_recipes
        elif nutri == 2:
            sort_recipes = sorted(recipes, key=lambda recipes: recipes.sugar, reverse=True)
            return sort_recipes
        elif nutri == 4:
            sort_recipes = sorted(recipes, key=lambda recipes: recipes.protein, reverse=True)
            return sort_recipes
        elif nutri == 6:
            sort_recipes = sorted(recipes, key=lambda recipes: recipes.sodium, reverse=True)
            return sort_recipes
