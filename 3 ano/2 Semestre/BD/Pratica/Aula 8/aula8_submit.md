# BD: Guião 8


## ​8.1
 
### *a)*

```sql
CREATE PROC removeEmployee @Ssn as varchar(10)
AS
BEGIN
    UPDATE EMPLOYEE
    SET Super_ssn = 'Null'
    WHERE Super_ssn = @Ssn;

    UPDATE DEPARTMENT
    SET Mgr_ssn = 'Null'
    WHERE Mgr_ssn = @Ssn;

    DELETE FROM WORKS_ON
    WHERE Essn = @Ssn;

    DELETE FROM [DEPENDENT]
    WHERE Essn = @Ssn;

    DELETE FROM Employee
    WHERE Ssn = @Ssn;

END;
```

### *b)* 

```sql
CREATE PROC departmentManagers (@Ssn as char(9) output, @oldestManager as tiyint output)
AS
BEGIN
    DECLARE @Ssn varchar(10);
    DECLARE @oldestManager INT;

    SELECT
        @Ssn = Mgr_Ssn
        @oldestManager = datediff(YEAR, Mgr_start_date, GetDate())
    
    FROM DEPARTMENT
    WHERE Mgr_start_date IS NOT NULL
    ORDER BY Mgr_start_date DESC;

    SELECT
        Fname,
        Minit,
        Lname,
        Ssn
    FROM EMPLOYEE
    JOIN DEPARTMENT
        ON Ssn = Mgr_ssn
    
END;



```

### *c)* 

```sql
CREATE TRIGGER CheckOneManagerDept ON DEPARTMENT
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @NewManager varchar(9);

    -- Guardar o Mgr_ssn da tabela 'inserted' dentro da variável 
    SELECT @NewManager = Mgr_ssn FROM inserted;

    -- Fazer um COUNT(*) na tabela real filtrando por esse SSN especifico
    IF (SELECT COUNT(*) FROM DEPARTMENT WHERE Mgr_ssn = @NewManager) > 1
    BEGIN
        RAISERROR ('Erro: Este funcionário já gere um departamento!', 16, 1);
        ROLLBACK TRANSACTION;
    END
END
```

### *d)* 

```sql
CREATE TRIGGER FixSalaryCap ON EMPLOYEE
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @Dno int;
    DECLARE @EmployeeSalary int;
    DECLARE @EmployeeSSN varchar(9);
    DECLARE @ManagerSSN varchar(9);
    DECLARE @ManagerSalary int;

    SELECT @Dno = Dno, @EmployeeSalary = Salary, @EmployeeSSN = Ssn
    FROM inserted
    
    SELECT @ManagerSSN = Mgr_SSN
    FROM DEPARTMENT
    WHERE Dnumber = @Dno

    SELECT @ManagerSalary = Salary
    FROM EMPLOYEE
    WHERE Ssn = @ManagerSSN

    IF (@EmployeeSalary > @ManagerSalary) 
    BEGIN
        UPDATE EMPLOYEE
        SET Salary = (@ManagerSalary - 1)
        WHERE Ssn = @EmployeeSSN
    END;
    
END;
```

### *e)* 

```sql
CREATE FUNCTION WhereWorks (@Ssn varchar(9))
RETURNS TABLE
AS
RETURN 
(

    SELECT Pname, Plocation
    FROM WORKS_ON as w
    JOIN PROJECT as p ON w.Pno = p.Pnumber
    WHERE Essn = @Ssn

);
```

### *f)* 

```sql
CREATE FUNCTION dbo.EmployeeAboveAvgSalary (@dno INT)
RETURNS TABLE
AS
RETURN (
    SELECT Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno
    FROM EMPLOYEE
    WHERE Dno = @dno AND Salary > (
        SELECT AVG(Salary)
        FROM EMPLOYEE
        WHERE Dno = @dno
    )
);
```

### *g)* 

```sql
CREATE FUNCTION dbo.DepartmentProjectsBudget (@dno INT)
RETURNS @ProjectBudget TABLE (
    pname VARCHAR(50),
    pnumber INT,
    plocation VARCHAR(50),
    dnum INT,
    budget DECIMAL(10, 2),
    totalbudget DECIMAL(10, 2)
)
AS
BEGIN
    DECLARE @pname VARCHAR(50), @pnumber INT, @plocation VARCHAR(50), @dnum_proj INT;
    DECLARE @budget DECIMAL(10, 2);
    DECLARE @totalbudget DECIMAL(10, 2) = 0;

    -- Declaração do cursor para iterar pelos projetos do departamento
    DECLARE proj_cursor CURSOR FOR
    SELECT Pname, Pnumber, Plocation, Dnum
    FROM PROJECT
    WHERE Dnum = @dno;

    OPEN proj_cursor;
    FETCH NEXT FROM proj_cursor INTO @pname, @pnumber, @plocation, @dnum_proj;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Cálculo do orçamento de mão de obra do projeto
        -- Custo = (Salário / 40h) * Horas dedicadas
        SELECT @budget = ISNULL(SUM((E.Salary / 40.0) * W.Hours), 0)
        FROM WORKS_ON W
        JOIN EMPLOYEE E ON W.Essn = E.Ssn
        WHERE W.Pno = @pnumber;

        -- Cálculo do valor acumulado
        SET @totalbudget = @totalbudget + @budget;

        INSERT INTO @ProjectBudget (pname, pnumber, plocation, dnum, budget, totalbudget)
        VALUES (@pname, @pnumber, @plocation, @dnum_proj, @budget, @totalbudget);

        FETCH NEXT FROM proj_cursor INTO @pname, @pnumber, @plocation, @dnum_proj;
    END;

    CLOSE proj_cursor;
    DEALLOCATE proj_cursor;

    RETURN;
END;
```

### *h)* 

```sql
CREATE TRIGGER trg_AfterDeleteDepartment
ON DEPARTMENT
AFTER DELETE
AS
BEGIN
    -- Verifica se a tabela existe; se não, cria-a
    IF NOT (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
                    WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'department_deleted'))
    BEGIN
        CREATE TABLE dbo.department_deleted (
            Dname VARCHAR(50),
            Dnumber INT,
            Mgr_ssn CHAR(9),
            Mgr_start_date DATE
        );
    END

    -- Insere os registos apagados na tabela de backup
    INSERT INTO dbo.department_deleted (Dname, Dnumber, Mgr_ssn, Mgr_start_date)
    SELECT Dname, Dnumber, Mgr_ssn, Mgr_start_date
    FROM deleted;
END;
```

```sql
CREATE TRIGGER trg_InsteadOfDeleteDepartment
ON DEPARTMENT
INSTEAD OF DELETE
AS
BEGIN
    IF NOT (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
                    WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'department_deleted'))
    BEGIN
        CREATE TABLE dbo.department_deleted (
            Dname VARCHAR(50),
            Dnumber INT,
            Mgr_ssn CHAR(9),
            Mgr_start_date DATE
        );
    END

    -- Regista na tabela de backup
    INSERT INTO dbo.department_deleted (Dname, Dnumber, Mgr_ssn, Mgr_start_date)
    SELECT Dname, Dnumber, Mgr_ssn, Mgr_start_date
    FROM deleted;

    -- Executa a eliminação real na tabela original (obrigatório num INSTEAD OF)
    DELETE FROM DEPARTMENT
    WHERE Dnumber IN (SELECT Dnumber FROM deleted);
END;
```

### *i)* 

```
Stored Procedures (SPs) executam lógica complexa, modificam dados e suportam transações.
UDFs (User-Defined Functions) apenas leem dados, exigem retorno de valores e não podem alterar tabelas.
As SPs destacam-se pelo encapsulamento seguro, enquanto as UDFs integram-se de forma útil em comandos de seleção e filtragem.
Deves usar SPs para tarefas transacionais, como processar salários ou atualizar o estado de um departamento.
Deves usar UDFs para cálculos rápidos e reutilizáveis, como calcular a idade de um funcionário numa query.
```
