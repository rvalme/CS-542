import io


class Recipe:

    def __init__(self):
        self.__recipe_id = None
        self.__recipe_name = None
        self.__sugar = 0
        self.__fat = 0
        self.__protein = 0
        self.__calories =0
        self.__sodium = 0
        self.__carbs = 0

    @property
    def recipe_id(self):
        return self.__recipe_id

    @recipe_id.setter
    def recipe_id(self, recipe_id):
        self.__recipe_id = recipe_id

    @property
    def recipe_name(self):
        return self.__recipe_name

    @recipe_name.setter
    def recipe_name(self,recipe_name):
        self.__recipe_name = recipe_name

    @property
    def fat(self):
        return self.__fat

    @fat.setter
    def fat(self, fat):
        self.__sugar = fat

    @property
    def protein(self):
        return self.__protein

    @protein.setter
    def protein(self, protein):
        self.__protein = protein

    @property
    def calories(self):
        return self.__calories

    @calories.setter
    def calories(self, calories):
        self.__calories = calories

    @property
    def sodium(self):
        return self.__sodium

    @sodium.setter
    def sodium(self, sodium):
        self.__sodium = sodium

    @property
    def sugar(self):
        return self.__sugar

    @sugar.setter
    def sugar(self, sugar):
        self.__sugar = sugar

    @property
    def carbs(self):
        return self.__carbs

    @carbs.setter
    def carbs(self, carbs):
        self.__carbs = carbs

    def __eq__(self, other):
        equal = False
        if self is other:
            equal = True
        elif type(other) is type(self):
            if self.recipe_id == other.recipe_id:
                equal = True
            return equal

    def __ne__(self, other):
        return not (self==other)


    def __repr__(self):
        return "recipe id: {0}, recipe name: {1}, calories: {2}, carbs: {3}g, sugar: {4}g, fat: {5}g, protein: {6}g, sodium: {7}mg "\
            .format(self.__recipe_id, self.__recipe_name, self.__calories,
                                                           self.__carbs, self.__sugar, self.__fat, self.__protein,
                                                           self.__sodium)

    def to_string(self):
        return print(repr(self))

