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
RNAME CHAR(20),
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
VALUES('R01', 'Spicy Kale Slaw', '0g', '30g', '24g', '0g', '333g', '292mg', 9);

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
INAME CHAR(20),
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

CREATE TABLE MakesUp(
INAME CHAR(20),
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

SELECT * from Recipe;
SELECT * from MakesUp;
SELECT * from Ingredient;
