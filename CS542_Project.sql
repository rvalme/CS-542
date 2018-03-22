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
CID CHAR(20),
PRIMARY KEY(CID));

INSERT
INTO Chef(CID)
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
PRIMARY KEY(RID));

INSERT
INTO Recipe(RID, RNAME, Carbs, Sugar, Fat, Protein, Calories, Sodium)
VALUES('R01', 'Spicy Kale Slaw', '0g', '30g', '24g', '0g', '333g', '292mg');

CREATE TABLE CanRequest(
RID CHAR(20),
CID CHAR(20),
PRIMARY KEY(RID, CID),
FOREIGN KEY (CID) REFERENCES Customer (CID),
FOREIGN KEY (RID) REFERENCES Recipe (RID));

INSERT
INTO CanRequest(RID, CID)
VALUES('R01', 'C01');

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
CID CHAR(20),
PRIMARY KEY(RID, CID),
FOREIGN KEY (CID) REFERENCES Chef (CID),
FOREIGN KEY (RID) REFERENCES Recipe (RID));

INSERT
INTO MakesInstanceOf(RID, CID)
VALUES('R01', 'C01');

CREATE TABLE Ingredient(
INAME CHAR(20),
PRIMARY KEY (INAME));

INSERT
INTO Ingredient(INAME)
VALUES('Kale');

INSERT
INTO Ingredient(INAME)
VALUES('Carrot');

INSERT
INTO Ingredient(INAME)
VALUES('Pecans');

INSERT
INTO Ingredient(INAME)
VALUES('Golden raisins');

INSERT
INTO Ingredient(INAME)
VALUES('Veganaise');

INSERT
INTO Ingredient(INAME)
VALUES('Apple cider vinegar');

INSERT
INTO Ingredient(INAME)
VALUES('Sugar');

INSERT
INTO Ingredient(INAME)
VALUES('Ground allspice');

INSERT
INTO Ingredient(INAME)
VALUES('Dried oregano');

INSERT
INTO Ingredient(INAME)
VALUES('Dried thyme');

INSERT
INTO Ingredient(INAME)
VALUES('Paprika');

INSERT
INTO Ingredient(INAME)
VALUES('Cayenne pepper');

INSERT
INTO Ingredient(INAME)
VALUES('Curry powder');

INSERT
INTO Ingredient(INAME)
VALUES('Salt');

INSERT
INTO Ingredient(INAME)
VALUES('Black pepper');

INSERT
INTO Ingredient(INAME)
VALUES('Nutmeg');

INSERT
INTO Ingredient(INAME)
VALUES('Cinnamon');

INSERT
INTO Ingredient(INAME)
VALUES('Ground clove');

CREATE TABLE MakesUp(
INAME CHAR(20),
RID CHAR(20),
PRIMARY KEY (INAME, RID),
FOREIGN KEY (INAME) REFERENCES Ingredient (INAME),
FOREIGN KEY (RID) REFERENCES Recipe (RID));

INSERT
INTO MakesUp(INAME, RID)
VALUES('Kale', 'R01');

INSERT
INTO MakesUp(INAME, RID)
VALUES('Carrot', 'R01');

INSERT
INTO MakesUp(INAME, RID)
VALUES('Pecans', 'R01');

INSERT
INTO MakesUp(INAME, RID)
VALUES('Golden raisins', 'R01');

INSERT
INTO MakesUp(INAME, RID)
VALUES('Veganaise', 'R01');

INSERT
INTO MakesUp(INAME, RID)
VALUES('Apple cider vinegar', 'R01');

INSERT
INTO MakesUp(INAME, RID)
VALUES('Sugar', 'R01');

INSERT
INTO MakesUp(INAME, RID)
VALUES('Ground allspice', 'R01');

INSERT
INTO MakesUp(INAME, RID)
VALUES('Dried oregano', 'R01');

INSERT
INTO MakesUp(INAME, RID)
VALUES('Dried thyme', 'R01');

INSERT
INTO MakesUp(INAME, RID)
VALUES('Paprika', 'R01');

INSERT
INTO MakesUp(INAME, RID)
VALUES('Cayenne pepper', 'R01');

INSERT
INTO MakesUp(INAME, RID)
VALUES('Curry powder', 'R01');

INSERT
INTO MakesUp(INAME, RID)
VALUES('Salt', 'R01');

INSERT
INTO MakesUp(INAME, RID)
VALUES('Black pepper', 'R01');

INSERT
INTO MakesUp(INAME, RID)
VALUES('Nutmeg', 'R01');

INSERT
INTO MakesUp(INAME, RID)
VALUES('Cinnamon', 'R01');

INSERT
INTO MakesUp(INAME, RID)
VALUES('Ground clove', 'R01');

SELECT * from Recipe;
SELECT * from MakesUp;
SELECT * FROM recipe;
SELECT * FROM ingredient;