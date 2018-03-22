from recipe.recipe import Recipe
import re
class DaoRecipe():
    def __init__(self):
        pass

    def add_all(self, recipe_list):
        for i in range(len(recipe_list)):
            recipes = recipe_list[i]
            #single_recipe=build_recipe(recipes)

    def add_recipe(self,recipe_list):
        pass

    def build_recipe(self, recipe_tuple):
        recipe_instance = Recipe()
        recipe_list=[]
        for i in range(2,len(recipe_tuple)):
            recipe_info_str = re.findall('\d+', recipe_tuple[i])
            recipe_info_int = int(recipe_info_str[0])
            recipe_list.append(recipe_info_int)
        recipe_instance.recipe_id = recipe_tuple[0]
        recipe_instance.recipe_name = recipe_tuple[1]
        recipe_instance.calories = recipe_list[0]
        recipe_instance.fat = recipe_list[1]
        recipe_instance.protein = recipe_list[2]
        recipe_instance.sodium = recipe_list[3]
        recipe_instance.sugar = recipe_list[4]
        recipe_instance.carbs = recipe_list[5]
        return recipe_instance
        #recipe_instance.to_string()

    '''
    s = ('300g', '200g', '500g')
    for i in range(len(s)):
        number = re.findall('\d+', s[i])
        number = int(number[0])
        print(number)
    '''