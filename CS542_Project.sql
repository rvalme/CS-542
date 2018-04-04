DROP TABLE MakesUp;
DROP TABLE CanRequest;
DROP TABLE Chooses;
DROP TABLE SubscribesTo;
DROP TABLE MakesInstanceOf;
DROP TABLE Ingredient;
DROP TABLE Customer;
DROP TABLE Recipe;
DROP TABLE Chef;
DROP TABLE Diet;

CREATE TABLE Customer(
CID CHAR(20),
PRIMARY KEY(CID));

INSERT
INTO Customer(CID)
VALUES('C01');


CREATE TABLE Diet(
Type_of_diet CHAR(20),
PRIMARY KEY(Type_of_diet)); 

INSERT
INTO Diet(Type_of_diet)
VALUES('Vegetarian');

INSERT
INTO Diet(Type_of_diet)
VALUES('Vegan');


INSERT
INTO Diet(Type_of_diet)
VALUES('Paleolithic');


INSERT
INTO Diet(Type_of_diet)
VALUES('Ketogenic');

CREATE TABLE Chooses(
Type_of_diet CHAR(20),
CID CHAR(20),
PRIMARY KEY(CID, Type_of_diet),
FOREIGN KEY (CID) REFERENCES Customer (CID),
FOREIGN KEY (Type_of_diet) REFERENCES Diet (Type_of_diet));

INSERT
INTO Chooses(Type_of_diet, CID)
VALUES('Vegetarian', 'C01');


CREATE TABLE Chef(
ChID CHAR(20),
PRIMARY KEY(ChID));

INSERT
INTO Chef(ChID)
VALUES('Ch01');

INSERT
INTO Chef(ChID)
VALUES('Ch02');

INSERT
INTO Chef(ChID)
VALUES('Ch03');

INSERT
INTO Chef(ChID)
VALUES('Ch04');

CREATE TABLE Recipe(
RID CHAR(20),
RNAME CHAR(40),
Carbs REAL,
Sugar REAL,
Fat REAL,
Protein REAL,
Calories REAL,
Sodium REAL,
Money_Cost REAL,
PRIMARY KEY(RID));

INSERT
INTO Recipe(RID, RNAME, Carbs, Sugar, Fat, Protein, Calories, Sodium, Money_Cost)
VALUES('R01', 'Spicy Kale Slaw', 0, 30, 24, 0, 100, 292, 9);

INSERT
INTO Recipe(RID, RNAME, Carbs, Sugar, Fat, Protein, Calories, Sodium, Money_Cost)
VALUES('R02', 'Smokin Ground Tempeh', 10, 3, 4, 7, 100, 292, 8);

INSERT
INTO Recipe(RID, RNAME, Carbs, Sugar, Fat, Protein, Calories, Sodium, Money_Cost)
VALUES('R03', 'Black-eyed Pea Fritters', 0, 0, 2, 10, 180, 10, 7);

INSERT
INTO Recipe(RID, RNAME, Carbs, Sugar, Fat, Protein, Calories, Sodium, Money_Cost)
VALUES('R04', 'Black Bean and Mango Salsa', 8, 1, 0, 0, 34, 83, 5);

INSERT
INTO Recipe(RID, RNAME, Carbs, Sugar, Fat, Protein, Calories, Sodium, Money_Cost)
VALUES('R05', 'Green Goddess Hummus', 11.6, 1.7, 9.6, 4.5, 142, 249.4, 6);

INSERT
INTO Recipe(RID, RNAME, Carbs, Sugar, Fat, Protein, Calories, Sodium, Money_Cost)
VALUES('R06', 'Crispy Baked Tofu', 3.4, .8, 9.5, 11.9, 136, 179.7, 4);

INSERT
INTO Recipe(RID, RNAME, Carbs, Sugar, Fat, Protein, Calories, Sodium, Money_Cost)
VALUES('R07', 'Vegan Garlic Bread', 19.2, 5.2, 5.2, 5.2, 141, 190.1, 3);

INSERT
INTO Recipe(RID, RNAME, Carbs, Sugar, Fat, Protein, Calories, Sodium, Money_Cost)
VALUES('R08', 'Kale Chips', 7.8, 0, 3.2, 2.2, 69, 32, 3);

INSERT
INTO Recipe(RID, RNAME, Carbs, Sugar, Fat, Protein, Calories, Sodium, Money_Cost)
VALUES('R09', 'Slow Cooker Paprika Chicken', 8, 3.4, 6.3, 35.6, 237, 1586, 7);

INSERT
INTO Recipe(RID, RNAME, Carbs, Sugar, Fat, Protein, Calories, Sodium, Money_Cost)
VALUES('R10', 'Chorizo Stuffed Jalapenos', 13.1, 2, 88.3, 56.5, 1080, 4277, 7);

INSERT
INTO Recipe(RID, RNAME, Carbs, Sugar, Fat, Protein, Calories, Sodium, Money_Cost)
VALUES('R11', 'Chocolate Walnut Date Balls', 384.9, 254.5, 76.6, 45.8, 2152, 943, 7);


INSERT
INTO Recipe(RID, RNAME, Carbs, Sugar, Fat, Protein, Calories, Sodium, Money_Cost)
VALUES('R12', 'Olive Oil Mashed Cauliflower', 25.2, 11.6, 70.7, 9.4, 721, 1065, 7);

INSERT
INTO Recipe(RID, RNAME, Carbs, Sugar, Fat, Protein, Calories, Sodium, Money_Cost)
VALUES('R13', 'Ultimate Breakfast Roll Ups', 3.7, 1.4, 34, 24.9, 426, 1361, 5);

INSERT
INTO Recipe(RID, RNAME, Carbs, Sugar, Fat, Protein, Calories, Sodium, Money_Cost)
VALUES('R14', 'Tomato Basil and Mozzarella Galette', 14.6, 3.6, 29.8, 25.1, 424, 350, 6);

INSERT
INTO Recipe(RID, RNAME, Carbs, Sugar, Fat, Protein, Calories, Sodium, Money_Cost)
VALUES('R15', 'Creamy Beef Casserole', 17, 1.3, 28.6, 52.8, 552, 350, 6);


INSERT
INTO Recipe(RID, RNAME, Carbs, Sugar, Fat, Protein, Calories, Sodium, Money_Cost)
VALUES('R16', 'Caprese Chicken Thigh', 3.7, 1, 26.1, 61.8, 503, 838, 6);


CREATE TABLE CanRequest(
RID CHAR(20),
CID CHAR(20),
Quantity INT,
PRIMARY KEY(RID, CID),
FOREIGN KEY (CID) REFERENCES Customer (CID),
FOREIGN KEY (RID) REFERENCES Recipe (RID));

INSERT
INTO CanRequest(RID, CID, Quantity)
VALUES('R01', 'C01', 1);

CREATE TABLE SubscribesTo(
RID CHAR(20),
Type_of_diet CHAR(20),
PRIMARY KEY(RID, Type_of_diet),
FOREIGN KEY (RID) REFERENCES Recipe (RID),
FOREIGN KEY (Type_of_diet) REFERENCES Diet (Type_of_diet));

INSERT
INTO SubscribesTo(RID, Type_of_diet)
VALUES('R01', 'Vegetarian');

INSERT
INTO SubscribesTo(RID, Type_of_diet)
VALUES('R02', 'Vegetarian');

INSERT
INTO SubscribesTo(RID, Type_of_diet)
VALUES('R03', 'Vegetarian');

INSERT
INTO SubscribesTo(RID, Type_of_diet)
VALUES('R04', 'Vegetarian');

INSERT
INTO SubscribesTo(RID, Type_of_diet)
VALUES('R05', 'Vegan');

INSERT
INTO SubscribesTo(RID, Type_of_diet)
VALUES('R06', 'Vegan');

INSERT
INTO SubscribesTo(RID, Type_of_diet)
VALUES('R07', 'Vegan');

INSERT
INTO SubscribesTo(RID, Type_of_diet)
VALUES('R08', 'Vegan');

INSERT
INTO SubscribesTo(RID, Type_of_diet)
VALUES('R09', 'Paleolithic');

INSERT
INTO SubscribesTo(RID, Type_of_diet)
VALUES('R10', 'Paleolithic');

INSERT
INTO SubscribesTo(RID, Type_of_diet)
VALUES('R11', 'Paleolithic');

INSERT
INTO SubscribesTo(RID, Type_of_diet)
VALUES('R12', 'Paleolithic');


INSERT
INTO SubscribesTo(RID, Type_of_diet)
VALUES('R13', 'Ketogenic');

INSERT
INTO SubscribesTo(RID, Type_of_diet)
VALUES('R14', 'Ketogenic');

INSERT
INTO SubscribesTo(RID, Type_of_diet)
VALUES('R15', 'Ketogenic');

INSERT
INTO SubscribesTo(RID, Type_of_diet)
VALUES('R16', 'Ketogenic');


CREATE TABLE MakesInstanceOf(
RID CHAR(20),
ChID CHAR(20),
PRIMARY KEY(RID, ChID),
FOREIGN KEY (ChID) REFERENCES Chef (ChID),
FOREIGN KEY (RID) REFERENCES Recipe (RID));

INSERT
INTO MakesInstanceOf(RID, ChID)
VALUES('R01', 'Ch01');

INSERT
INTO MakesInstanceOf(RID, ChID)
VALUES('R02', 'Ch01');

INSERT
INTO MakesInstanceOf(RID, ChID)
VALUES('R03', 'Ch01');

INSERT
INTO MakesInstanceOf(RID, ChID)
VALUES('R04', 'Ch01');

INSERT
INTO MakesInstanceOf(RID, ChID)
VALUES('R05', 'Ch02');

INSERT
INTO MakesInstanceOf(RID, ChID)
VALUES('R06', 'Ch02');

INSERT
INTO MakesInstanceOf(RID, ChID)
VALUES('R07', 'Ch02');

INSERT
INTO MakesInstanceOf(RID, ChID)
VALUES('R08', 'Ch02');

INSERT
INTO MakesInstanceOf(RID, ChID)
VALUES('R09', 'Ch03');

INSERT
INTO MakesInstanceOf(RID, ChID)
VALUES('R10', 'Ch03');

INSERT
INTO MakesInstanceOf(RID, ChID)
VALUES('R11', 'Ch03');

INSERT
INTO MakesInstanceOf(RID, ChID)
VALUES('R12', 'Ch03');

INSERT
INTO MakesInstanceOf(RID, ChID)
VALUES('R13', 'Ch04');

INSERT
INTO MakesInstanceOf(RID, ChID)
VALUES('R14', 'Ch04');

INSERT
INTO MakesInstanceOf(RID, ChID)
VALUES('R15', 'Ch04');

INSERT
INTO MakesInstanceOf(RID, ChID)
VALUES('R16', 'Ch04');

CREATE TABLE Ingredient(
INAME CHAR(30),
Quantity REAL,
Unit CHAR(20),
PRIMARY KEY (INAME));

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Kale', 20, 'cups');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Carrot', 20, 'actual');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Pecans', 20, 'cups');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Golden raisins', 20, 'cups');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Veganaise', 20, 'cups');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Apple cider vinegar', 20, 'tbsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Sugar', 20, 'tbsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Ground allspice', 20, 'tbsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Dried oregano', 20, 'tsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Dried thyme', 20, 'tsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Paprika', 20, 'tsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Cayenne pepper', 20, 'tsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Curry powder', 20, 'tsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Salt', 20, 'tsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Black pepper', 20, 'tsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Nutmeg', 20, 'tsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Cinnamon', 20, 'tsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Ground clove', 20, 'tsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Tempeh', 20, 'oz');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Smoked Tempeh Strips', 20, 'oz');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Water', 20, 'cups');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Bay Leaf', 20, 'actual');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Safflower oil', 20, 'tbsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Garlic cloves', 20, 'actual');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Onion', 20, 'actual');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Chipotle peppers', 20, 'actual');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Adobo sauce', 20, 'tbsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Jalapeno', 20, 'actual');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Tomato paste', 20, 'can');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Vegetable broth', 20, 'cups');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Chili powder', 20, 'tbsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Brown mustard seeds', 20, 'tbsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Fresh ground pepper', 20, 'tsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Diced tomatoes', 20, 'actual');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Stewed tomatoes', 20, 'can');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Liquid smoke', 20, 'tsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Cilantro', 20, 'cup');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Dried black-eyed peas', 20, 'lbs');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Bread flour', 20, 'cups');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Baking powder', 20, 'tbsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Dried parsely', 20, 'tbsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Red bell pepper', 20, 'actual');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Seasoned salt', 20, 'tbsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Plum tomatoes', 20, 'cups');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Orange bell pepper', 20, 'cups');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Mango', 20, 'cups');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Green onions', 20, 'cups');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Lime juice', 20, 'tbsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Black beans', 20, 'oz');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Tahini', 20, 'cups');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Lemon juice', 20, 'tbsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Olive oil', 20, 'tbsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('tarragon', 20, 'cup');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('chives', 20, 'tbsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('chickpeas', 20, 'oz');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Tofu', 20, 'oz');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Tamari', 20, 'tbsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Cornstarch', 20, 'tbsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Bread', 20, 'oz');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Avocado oil', 20, 'ml');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Chicken breast', 20, 'lbs');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Chicken broth', 20, 'cups');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Chorizo', 20, 'lbs');


INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Ground cumin', 20, 'tsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Walnuts', 20, 'cups');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Dates pitted', 20, 'actual');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Sea salt', 20, 'tsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Vanilla extract', 20, 'tsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Cocoa powder', 20, 'cups');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Cauliflower', 20, 'cups');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Coconut milk', 20, 'cups');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Eggs', 20, 'actual');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Shredded Cheese', 20, 'cups');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Sliced bacon', 20, 'actual');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Sausage', 20, 'lbs');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Almond flour', 20, 'cup');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Mozzarella', 20, 'tbsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Mozzarella pearls', 20, 'ounce');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Cherry tomatoes', 20, 'actual');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Garlic powder', 20, 'tsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Basil leaves', 20, 'cups');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Cauliflower rice', 20, 'lbs');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Ground beef', 20, 'lbs');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Green enchilada sauce', 20, 'lbs');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Sour cream', 20, 'cups');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Cottage Cheese', 20, 'cups');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Butter', 20, 'tbsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Chicken thigh', 20, 'actual');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Pine nuts ', 20, 'cups');



CREATE TABLE MakesUp(
INAME CHAR(30),
RID CHAR(20),
Amount REAL,
PRIMARY KEY (INAME, RID),
FOREIGN KEY (INAME) REFERENCES Ingredient (INAME),
FOREIGN KEY (RID) REFERENCES Recipe (RID));

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Kale', 'R01', 4);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Carrot', 'R01', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Pecans', 'R01', .5);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Golden raisins', 'R01', .25);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Veganaise', 'R01', .5);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Apple cider vinegar', 'R01', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Sugar', 'R01', 2);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Ground allspice', 'R01', .5);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Dried oregano', 'R01', 1.5);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Dried thyme', 'R01', .5);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Paprika', 'R01', .5);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Cayenne pepper', 'R01', .25);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Curry powder', 'R01', .25);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Salt', 'R01', .25);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Black pepper', 'R01', .25);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Nutmeg', 'R01', .125);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Cinnamon', 'R01', .125);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Ground clove', 'R01', .125);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Tempeh', 'R02', 4);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Smoked Tempeh Strips', 'R02', 4);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Water', 'R02', 6);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Bay Leaf', 'R02', 1);


INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Safflower oil', 'R02', 2);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Garlic cloves', 'R02', 6);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Onion', 'R02', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Chipotle peppers', 'R02', 2);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Adobo sauce', 'R02', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Jalapeno', 'R02', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Tomato paste', 'R02', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Vegetable broth', 'R02', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Chili powder', 'R02', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Paprika', 'R02', 6);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Brown mustard seeds', 'R02', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Fresh ground pepper', 'R02', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Salt', 'R02', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Diced tomatoes', 'R02', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Stewed tomatoes', 'R02', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Liquid smoke', 'R02', .5);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Cilantro', 'R02', .5);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Dried black-eyed peas', 'R03', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Bread flour', 'R03', .5);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Baking powder', 'R03', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Dried parsely', 'R03', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Onion', 'R03', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Red bell pepper', 'R03', .5);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Seasoned salt', 'R03', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Garlic cloves', 'R03', 4);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Plum tomatoes', 'R04', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Orange bell pepper', 'R04', .5);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Mango', 'R04', .5);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Green onions', 'R04', .25);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Cilantro', 'R04', 3);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Lime juice', 'R04', 2);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Black beans', 'R04', 8);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Tahini', 'R05', .25);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Lemon juice', 'R05', 4);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Olive oil', 'R05', 2);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Dried parsely', 'R05', 8);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('tarragon', 'R05', .25);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('chives', 'R05', 2);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Garlic cloves', 'R05', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Salt', 'R05', .5);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('chickpeas', 'R05', 15);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Water', 'R05', .125);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Tofu', 'R06', 12);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Tamari', 'R06', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Cornstarch', 'R06', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Olive oil', 'R06', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Garlic cloves', 'R07', 2);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Tahini', 'R07', .25);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Water', 'R07', .25);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Salt', 'R07', .5);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Bread', 'R07', 10);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Kale', 'R08', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Avocado oil', 'R08', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Chili powder', 'R08', .3);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Chicken breast', 'R09', 1.5);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Onion', 'R09', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Paprika', 'R09', 3);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Lemon juice', 'R09', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Chicken broth', 'R09', 2);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Chorizo', 'R10', 1.5);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Ground cumin', 'R10', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Dried oregano', 'R10',.5);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Garlic cloves', 'R10', 2);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Jalapeno', 'R10', 4);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Fresh ground pepper', 'R10', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Walnuts', 'R11', 1);


INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Dates pitted', 'R11', 12);


INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Vanilla extract', 'R11', 1);


INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Sea salt', 'R11', .5);


INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Cocoa powder', 'R11', .25);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Cauliflower', 'R12', 4);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Coconut milk', 'R12',.25);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Olive oil', 'R12', .25);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Sea salt', 'R12', .5);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Fresh ground pepper', 'R12', .5);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Eggs', 'R13', 10);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Salt', 'R13', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Fresh ground pepper', 'R13', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Shredded Cheese', 'R13', 1.5);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Sliced bacon', 'R13', 5);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Sausage', 'R13', 4);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Almond flour', 'R14', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Eggs', 'R14', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Mozzarella', 'R14', 3);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Garlic powder', 'R14', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Shredded Cheese', 'R14', .25);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Basil leaves', 'R14', .25);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Mozzarella pearls', 'R14', .5);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Cherry tomatoes', 'R14', 3);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Cauliflower rice', 'R15', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Ground beef', 'R15', 1.5);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Green enchilada sauce', 'R15', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Sour cream', 'R15', .5);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Cottage Cheese', 'R15', 1.25);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Shredded Cheese', 'R15', 3);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Green onions', 'R15', .5);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Salt', 'R15', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Black pepper', 'R15', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Butter', 'R16', .5);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Chicken thigh', 'R16', 6);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Salt', 'R16', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Black pepper', 'R16', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Basil leaves', 'R16', 2);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Olive oil', 'R16', 8);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Pine nuts', 'R16', .25);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Diced tomatoes', 'R16', 1);

INSERT
INTO MakesUp(INAME, RID, Amount)
VALUES('Mozzarella pearls', 'R16', 6);


SELECT * from Recipe;
SELECT * from MakesUp;
SELECT * from Ingredient;
