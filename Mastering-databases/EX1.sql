 CREATE DATABASE GESTION_employee
 use GESTION_employee
create table Departements( DNO int , DNOM varchar(20), DIR  varchar(20), VILLE varchar(20))
create table Employes( ENO int , ENOM varchar(20), PROF int, DATEEMB date, SAL int , COMM int , DNO int references Departements(DNO) )
insert into Departements values(1,'haroun','azert','oujda')
insert into Departements values(2,'mbarek','azert','tanger')
insert into Departements values(3,'med','azert','ahfir')
/**********************************************************/
insert into Employes values(1,'haroun',5,'2020/5/7',5000,50,2)
insert into Employes values(2,'ahmed',8,'2020/5/7',4000,50,1)
insert into Employes values(3,'simo',10,'2020/9/7',8000,17,3)

 /*1 Donnez la liste des employés ayant une commission*/
SELECT * FROM Employes WHERE COMM not null

/*2 Donnez les noms, emplois et salaires des employés par emploi croissant, et pour chaque emploi, par salaire décroissant*/
 SELECT ENOM,PROF, SAL FROM Employes ORDER BY PROF ASC, SAL DESC
 
/*3 Donnez le salaire moyen des employés*/
SELECT AVG(SAL) FROM Employes 
/*4 Donnez le salaire moyen du département Production*/
SELECT AVG(E.SAL) FROM Employes E INNER JOIN Departements D
ON E.DNO=D.DNO WHERE D.DNOM="production"
/*5 Donnes les numéros de département et leur salaire maximum*/
SELECT DNO, MAX(SAL) FROM Employes GROUP BY DNO 
/*6 Donnez les différentes professions et leur salaire moyen*/
SELECT PROF, MAX(SAL) FROM Employes GROUP BY PROF 
/* 7 Donnez le salaire moyen par profession le plus bas*/
SELECT PROF, AVG(SAL) as moy FROM Employes 
GROUP BY PROF 
ORDER BY moy ASC
LIMIT 1 
/* 8 Donnez le ou les emplois ayant le salaire moyen le plus bas, ainsi que ce salaire moyen*/
SELECT PROF FROM Employes GROUP BY PROF
HAVING AVG(SAL)=(SELECT AVG(SAL) as moy FROM Employes
GROUP BY PROF ORDER BY moy ASC LIMIT 1) 