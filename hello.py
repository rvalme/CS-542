# -*- coding: utf-8 -*-
"""
Created on Sat Apr 07 16:50:09 2018

@author: Administrator
"""

from flask import Flask,url_for
from flask import render_template
from flask import request,jsonify
import os

app = Flask(__name__)
img_name = {'Spicy Kale Slaw': 'K.jpg', 'Black-eyed Pea Fritters': 'B.jpg', 'Green Goddess Hummus': 'GG.jpg', 'Vegan Garlic Bread': 'GB.jpg', 'Kale Chips': 'KC.jpg', 'Chorizo Stuffed Jalapenos': 'CSJ.jpg', 'Chocolate Walnut Date Balls': 'CWDB.jpg', 'Olive Oil Mashed Cauliflower': 'O.jpg'}

@app.route('/')
def home(name=None):
    return render_template('index.html', name=name)

from recipe.recipe import Recipe
from server.server_interface import ServerInterface
from server.dao_recipe import DaoRecipe
import itertools

@app.route('/_without_ingredient', methods=['GET', 'POST'])
def without_ingredient(name=None):
    server_interface=ServerInterface()
    #a = request.args.get('a', 0, type=str)
    #a = request.form['diet_t']
    a = request.form.getlist('without')[0]
    return render_template('index.html', name=name)

@app.route('/_submit_order', methods=['GET', 'POST'])
def submit_order(name=None):
    server_interface=ServerInterface()
    #a = request.form['diet_t']
    quantity = request.args.get('quantity', 0, type=str)
    recipe = request.args.get('recipe', 0, type=str)
    cid = request.args.get('cid', 0, type=str)
    rid = server_interface.get_rid(recipe)
    recipe_tuple = [(rid, cid, quantity)]
    server_interface.insert_order(recipe_tuple)
    return jsonify(img_name)


@app.route('/_sort_recipes', methods=['GET', 'POST'])
def sort_recipes(name=None):
    server_interface=ServerInterface()
    #a = request.args.get('a', 0, type=str)
    #a = request.form['diet_t']
    a = request.form.getlist('nutrients')[0]
    return render_template('index.html', name=name)

@app.route('/_select_recipes', methods=['GET', 'POST'])
def select_recipes(name=None):
    server_interface=ServerInterface()
    #a = request.args.get('a', 0, type=str)
    rname = request.form['recipe']
    recipe = server_interface.get_recipe(rname)
    recipe_dict = recipe.__dict__
    recipe_dict['_Recipe__img_name'] = img_name[rname]
    return render_template('selected_recipe.html', summary=recipe_dict)
    #a = request.form['recipe']
    #return a;

@app.route('/_search_recipes', methods=['GET', 'POST'])
def search_recipes():
    server_interface=ServerInterface()
    #a = request.args.get('a', 0, type=str)
    #a = request.form['diet_t']
    #import pdb;pdb.set_trace()
    a = request.args.get('diet')
    if(a == 'Vegan'):
        diet_number = 1
        recipes = server_interface.get_recipes(choice=diet_number)
        return jsonify(result=[recipe.__dict__ for recipe in recipes])
    elif (a == 'Vegetarian'):
        diet_number = 2
        recipes = server_interface.get_recipes(choice=diet_number)
        return jsonify(result=recipes)
    elif (a == 'Paleo'):
        diet_number = 3
        recipes = server_interface.get_recipes(choice=diet_number)
        return jsonify(result=recipes)
    else:
        diet_number = 0
        recipes = server_interface.get_recipes(choice=diet_number)
        return jsonify(result=recipes)

def main():
    '''
    Entry point for CS542 code
    The main function will retrieve the list of recipes of a particular diet from the
    database and print the list in the console
    '''
    server_interface=ServerInterface()
    log_in = True
    Keep_ordering = True
    while log_in:
        print('Vegan = 1, Vegetarian = 2, Paleo = 3, All = 0\n')
        diet_number = int(input('Enter a diet number or -1 to exit\n'))
        if not (0 <= diet_number <= 3 or diet_number == -1):
            print('Invalid input')
        elif diet_number == -1:
            print("Order finished")
            log_in = False
        else:
            recipes = server_interface.get_recipes(choice=diet_number)

            print(recipes)

if __name__ == '__main__':
    #main()
    app.run(debug=True)

