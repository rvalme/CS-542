'''
    File name: diet.py
    Author: Chu Wang
    Date Created: 3/21/2018
    Date last modified: 3/22/2018
    Python Version:3.6
'''

from enum import Enum, auto, unique

@unique
class Diet(Enum):
    VEGAN = auto()
    VEGETARIAN = auto()
    KETO = auto()
    PALEO = auto()