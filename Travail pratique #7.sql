--Exercise 1:
--#1
Ttitle center "### État des commandes par client ###" skip 2
COLUMN noClient HEADING "Numéro_de_client"
COLUMN noCommande HEADING "Numéro_de_commande"
COLUMN dateCommande HEADING "Date_de_la_commande"
break on noClient skip 1
select * from commande
Order by noClient;

--#2
Ttitle center "### État des commandes par date ###" skip 2
COLUMN noClient HEADING "Numéro_de_client"
COLUMN noCommande HEADING "Numéro_de_commande"
COLUMN dateCommande HEADING "Date_de_la_commande"
break on dateCommande skip 1
select * from commande
Order by dateCommande;

--#3
COLUMN today NOPRINT NEW_VALUE dateVAR
select to_char(SYSDATE, 'DD-MM-YYYY') today from dual;

Ttitle center "### Inventaire ###" skip 2 'Date :' dateVar skip 1
Btitle center "### Page" SQL.PNO "##"
COLUMN noArticle HEADING "Numéro article"
COLUMN description HEADING "Description"
COLUMN quantiteenstock HEADING "Qté en stock"
COLUMN noCommande HEADING "Qté totale Cdée"
select A.noArticle, A.description, A.quantiteenstock, L.quantite from article A, ligneCommande L
order by noArticle;

--#4


--Exercise 2:
Accept NumEmp prompt "Donner le nom de l'employé :";
select * from emp
where empNo = '&NumEmp'; 

--Exercise 3:
set serveroutput on format wrapped
set feedback off
set verify off
DECLARE
CURSOR Cur_Dept IS SELECT deptno, dname FROM DEPT;
v_dept Cur_Dept%ROWTYPE;

Cursor Cur_emp (numdept emp.deptno%TYPE) IS SELECT ename, job, hiredate, sal FROM EMP 
WHERE emp.deptno = numdept;
v_emp Cur_emp%ROWTYPE;

BEGIN
dbms_output.put_line('			## Liste des départements ##');

OPEN Cur_Dept;
LOOP
	FETCH Cur_Dept INTO v_dept;
	exit when Cur_dept%NOTFOUND;
	dbms_output.put_line('');
	dbms_output.put_line('Numéro:'||v_dept.deptno||'			' || 'Nom:'|| v_dept.dname);
	dbms_output.put_line('');
	
OPEN Cur_emp(v_dept.deptno);
LOOP
	FETCH Cur_emp INTO v_emp;
	exit when Cur_Emp%NOTFOUND;
	dbms_output.put_line(RPAD(v_emp.ename, 15)||RPAD(v_emp.job,15)||RPAD(TO_CHAR(v_emp.hiredate,'DD-MM-YYYY'),15)||RPAD(v_emp.sal,15));
	
END LOOP;
CLOSE Cur_Emp;

END LOOP;
CLOSE Cur_Dept;
END;
/

--Exercise 4:


set pagesize 50;
set serveroutput on;
set feedback off;
set verify off;

Accept N_Client prompt "Donner le numéro du client:";

DECLARE


CURSOR CUR_INFO IS SELECT A.NOARTICLE, A.DESCRIPTION, A.PRIXUNITAIRE, L.QUANTITE, A.PRIXUNITAIRE * L.QUANTITE AS MT 
FROM CLIENT E,ARTICLE A, LIGNECOMMANDE L, COMMANDE C WHERE (E.NOCLIENT = C.NOCLIENT) AND (C.NOCOMMANDE = L.NOCOMMANDE) 
AND (L.NOARTICLE = A.NOARTICLE) AND (E.NOCLIENT = '&N_Client');
V_info CUR_INFO%ROWTYPE;
BEGIN
dbms_output.put_line('			Confirmation de commande'); 
dbms_output.put_line('Emise par : 12456'); 
dbms_output.put_line('Date :' ||'&_date');
dbms_output.put_line(RPAD('Article',15) || RPAD('Description',15) || RPAD('Prix H.T',15) || RPAD('Qté cde.',15) || RPAD('Mt',15));
open CUR_INFO;
LOOP
FETCH CUR_INFO INTO V_info;
exit when CUR_INFO%NOTFOUND;
dbms_output.put_line(RPAD(V_info.noArticle,15)||RPAD(V_info.DESCRIPTION,15)||RPAD(V_info.PRIXUNITAIRE,15)||RPAD(V_info.QUANTITE,15)||RPAD((V_info.MT),15));
END LOOP;
dbms_output.put_line('Total H.T' ||'');
dbms_output.put_line('Taxe' ||'');

CLOSE CUR_INFO;
END;
/


