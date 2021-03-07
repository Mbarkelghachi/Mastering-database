create database gestion_projett
USE gestion_projett

 create table Developpeur (NumDev int primary key, NomDev varchar(50), AdrDev varchar(50) , EmailDev varchar(50), TelDev int)
 create table Projet (NumProj int primary key, TitreProj varchar(50), DateDeb date, DateFin date);
 create table Logiciel (CodLog int primary key, NomLog varchar(50) , PrixLog int, NumProj int references Projet(NumProj))
 create table Realisation (NumProj int , NumDev int , primary key(NumProj,NumDev))
 alter table Realisation add constraint fk foreign key (NumProj)references Projet(NumProj)
alter table Realisation add constraint fkk foreign key (NumDev)references Developpeur(NumDev)
    
    /*  1  */
SELECT L.NomLog, L.PrixLog FROM Logiciel L INNER JOIN Projet P
ON L.NumProj=P.NumProj WHERE P.TitreProj="gestion␣de␣stock"
ORDER BY L.PrixLog DESC

/*  2  */
SELECT SUM(PrixLog) as "total␣du␣projet" FROM Logiciel WHERE NumPRoj=10 

/* 3 */
SELECT count(*) FROM Developpeur D INNER JOIN Realisation R
ON D.NumDev=R.NumDev INNER JOIN Projet P ON P.NumPRoj=R.NumPRoj 
/* 4 */
SELECT NumProj, TitreProj FROM Projet P INNER JOIN Logiciel L ON P.NumProj=L.NumProj 
GROUP BY NumProj, TitreProj 
HAVING count(*)>5
/*  5 */
SELECT NumDev, NomDev FROM Developpeur D INNER JOIN Realisation R ON D.NumDev=R.NumDev
GROUP BY NumDev, NomDev
HAVING count(*)=(SELECT COUNT(*) FROM Projet)
/*  6 */
SELECT NumProj, TitreProj FROM Projet P INNER JOIN Realisation R ON P.NumProj=R.NumProj
GROUP BY NumProj, TitreProj
HAVING count(*)=(SELECT COUNT(*) FROM Developpeur)