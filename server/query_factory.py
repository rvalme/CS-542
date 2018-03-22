class QueryFactory:
    def __init__(self):
        pass
    def get_recipes(self):
        return 'SELECT * FROM recipe'

    def get_ingredients_in_recipe(self):
        return 'SELECT * FROM MakesUp'

    def get_ingredients(self):
        return 'SELECT * FROM Ingredient'