drop table emp20 CASCADE CONSTRAINTS;
CREATE TABLE EMP20(
NoEmp Number(4,0) constraint PK_NoEmp PRIMARY KEY,
Nom Varchar2(10),
Salaire Number(7,2) 
);	

DECLARE 
CURSOR Cur_Emp20 IS SELECT Empno, Ename, sal + NVL(comm,0)wages, Deptno FROM EMP;
TYPE Tenreg IS RECORD(NoEmp emp.Empno%type, nom emp.ename%type, salaire emp.sal%type, noDept emp.Deptno%type);
v_emp Tenreg;
BEGIN	
OPEN Cur_Emp20;
LOOP
FETCH Cur_Emp20 into v_emp;
EXIT when Cur_Emp20%NotFound;
  IF v_emp.noDept = 20 THEN
 	INSERT into EMP20 values(v_emp.NoEmp, v_emp.nom, v_emp.salaire);
  End If;
END LOOP;
Close Cur_emp20; 
End;
/