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
VALUES('C01');

CREATE TABLE Recipe(
RID CHAR(20),
RNAME CHAR(30),
Carbs CHAR(20),
Sugar CHAR(20),
Fat CHAR(20),
Protein CHAR(20),
Calories CHAR(20),
Sodium CHAR(20),
Money_Cost REAL,
PRIMARY KEY(RID));

INSERT
INTO Recipe(RID, RNAME, Carbs, Sugar, Fat, Protein, Calories, Sodium, Money_Cost)
VALUES('R01', 'Spicy Kale Slaw', '0g', '30g', '24g', '0g', '100kcal', '292mg', 9);

INSERT
INTO Recipe(RID, RNAME, Carbs, Sugar, Fat, Protein, Calories, Sodium, Money_Cost)
VALUES('R02', 'Smokin Ground Tempeh', '10g', '3g', '4g', '7g', '100kcal', '292mg', 8);

INSERT
INTO Recipe(RID, RNAME, Carbs, Sugar, Fat, Protein, Calories, Sodium, Money_Cost)
VALUES('R03', 'Black-eyed Pea Fritters', '0g', '0g', '2g', '10g', '180kcal', '10mg', 7);

INSERT
INTO Recipe(RID, RNAME, Carbs, Sugar, Fat, Protein, Calories, Sodium, Money_Cost)
VALUES('R04', 'Black Bean and Mango Salsa', '8g', '1g', '0g', '0g', '34kcal', '83mg', 5);

INSERT
INTO Recipe(RID, RNAME, Carbs, Sugar, Fat, Protein, Calories, Sodium, Money_Cost)
VALUES('R05', 'Green Goddess Hummus', '11.6g', '1.7g', '9.6g', '4.5g', '142kcal', '249.4mg', 6);

INSERT
INTO Recipe(RID, RNAME, Carbs, Sugar, Fat, Protein, Calories, Sodium, Money_Cost)
VALUES('R06', 'Crispy Baked Tofu', '3.4g', '.8g', '9.5g', '11.9g', '136kcal', '179.7mg', 4);

INSERT
INTO Recipe(RID, RNAME, Carbs, Sugar, Fat, Protein, Calories, Sodium, Money_Cost)
VALUES('R07', 'Vegan Garlic Bread', '19.2g', '5.2g', '5.2g', '5.2g', '141kcal', '190.1mg', 3);

INSERT
INTO Recipe(RID, RNAME, Carbs, Sugar, Fat, Protein, Calories, Sodium, Money_Cost)
VALUES('R08', 'Kale Chips', '7.8g', '0g', '3.2g', '2.2g', '69kcal', '32mg', 3);


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

CREATE TABLE MakesInstanceOf(
RID CHAR(20),
ChID CHAR(20),
PRIMARY KEY(RID, ChID),
FOREIGN KEY (ChID) REFERENCES Chef (ChID),
FOREIGN KEY (RID) REFERENCES Recipe (RID));

INSERT
INTO MakesInstanceOf(RID, ChID)
VALUES('R01', 'C01');

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
VALUES('Dried oregano', 20, 'tbsp');

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
VALUES('Safflower oil', 20, 'Tbsp');

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
VALUES('Adobo sauce', 20, 'Tbsp');

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
VALUES('Chili powder', 20, 'Tbsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Brown mustard seeds', 20, 'Tbsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Fresh ground pepper', 20, 'Tsp');

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
VALUES('Baking powder', 20, 'Tbsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Dried parsely', 20, 'Tbsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Red bell pepper', 20, 'actual');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Seasoned salt', 20, 'Tbsp');

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
VALUES('Lime juice', 20, 'Tbsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Black beans', 20, 'oz');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Tahini', 20, 'cups');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Lemon juice', 20, 'cups');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Olive oil', 20, 'Tbsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('tarragon', 20, 'cup');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('chives', 20, 'Tbsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('chickpeas', 20, 'oz');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Tofu', 20, 'oz');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Tamari', 20, 'Tbsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Cornstarch', 20, 'Tbsp');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Bread', 20, 'oz');

INSERT
INTO Ingredient(INAME, Quantity, Unit)
VALUES('Avocado oil', 20, 'ml');


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
VALUES('Dried oregano', 'R01', .5);

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
VALUES('Lemon juice', 'R05', .25);

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



SELECT * from Recipe;
SELECT * from MakesUp;
SELECT * from Ingredient;
