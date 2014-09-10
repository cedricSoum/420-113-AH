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