DROP table STATION cascade constraints;

CREATE TABLE STATION (
NumStation SMALLINT,
NumZone SMALLINT,
Constraint PK_STATION PRIMARY KEY (NumStation,NumZone) 
);

DROP table TYPE cascade constraints;

Create table TYPE(
Modele CHAR(5) Constraint PK_Modele PRIMARY KEY,
NbrePlaces smallint,
Categ CHAR(2) Constraint CK_Categ check(Categ = 'V' or Categ = 'PL'),
TypeCarburant CHAR(8),
Auto CHAR(1) Constraint CK_Auto check(Auto = 'O' or Auto = 'N'),
Poids smallint,
Constraint CK_ModeleTY check(Modele = 'TAXI1' or Modele = 'TAXI2' or Modele = 'BUS')
);

DROP table VEHICULE cascade constraints;

CREATE TABLE VEHICULE (
NumChassis INTEGER constraint PK_NumChassis PRIMARY KEY,
NumPlaque INTEGER,
MiseEnService DATE,
Modele constraint FK_Modele references TYPE(Modele),
NumStation SMALLINT,
Constraint PCK_NumChassis check(NumChassis between 100000 and 888888)
);

DROP table CHAUFFEUR cascade constraints;

CREATE TABLE CHAUFFEUR (
NumChauffeur INTEGER constraint PK_NumChauffeur PRIMARY KEY,
Nom VARCHAR2(25) not null,
Prénom VARCHAR2(25) not null,
Ville VARCHAR2(30) default('MONTREAL'),
NumStation smallint,
NumZone smallint,
constraint FK_CHAUFFEUR FOREIGN KEY (NumStation,NumZone) REFERENCES STATION(NumStation,NumZone)
);

drop table PERMIS cascade constraints;
Create table PERMIS(
NumChauffeur integer,
Categ char(2) Constraint CK_CategPE check(Categ = 'V' or Categ = 'PL'),
Constraint PK_Permis Primary Key(NumChauffeur, Categ),
Constraint FK_NumChauffeur Foreign Key(NumChauffeur) References CHAUFFEUR
);

DROP table PLANNING cascade constraints;

CREATE TABLE PLANNING (
NumChauffeur INTEGER,
NumChassis INTEGER,
NumJour SMALLINT,
TrancheHoraire CHAR(1) constraint CK_TrancheHoraire check (TrancheHoraire in('A','B','C')),
Constraint PK_PLANNING PRIMARY KEY (NumChauffeur,NumChassis,NumJour), 
constraint FK_NumChauffeurPL FOREIGN KEY(NumChauffeur) REFERENCES CHAUFFEUR,
constraint FK_NumChassis FOREIGN KEY(NumChassis) REFERENCES VEHICULE
);