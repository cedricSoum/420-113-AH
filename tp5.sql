DROP table STATION cascade constraints;

CREATE TABLE STATION (
NumStation SMALLINT,
NumZone SMALLINT,
Constraint PK_STATION PRIMARY KEY (NumStation,NumZone) 
);

DROP table TYPE cascade constraints;

CREATE TABLE TYPE (
Modele CHAR(5) constraint PK_Modele PRIMARY KEY,
NbrePlaces SMALLINT,
Categ CHAR(2) constraint CK_Categ check(Categ = 'Y' or Categ = 'PL'),
TypeCarburant CHAR(8),
Auto CHAR(1) constraint CK_Auto check(Auto = 'O' or Auto = 'N'), 
Poids SMALLINT,
Constraint PCK_Modele check(Modele = 'TAXI1' or Modele = 'TAXI2' or Modele = 'BUS')
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

DROP table PERMIS cascade constraints;

CREATE TABLE PERMIS (
NumChauffeur INTEGER constraint PK_NumChauffeurP PRIMARY KEY,
CONSTRAINT FK_PERMIS FOREIGN KEY(NumChauffeur) REFERENCES CHAUFFEUR(NumChauffeur),
Categ CHAR(2) constraint CK_CategPE check(Categ = 'V' or Categ = 'PL')
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