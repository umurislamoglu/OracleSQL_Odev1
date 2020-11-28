CREATE TABLE Task (
Task_Id int NOT NULL,
TaskName varchar(50) NOT NULL,
TaskStatus_Id int,
EmployeeId int,
Deadline date,
CONSTRAINT Task_PK PRIMARY KEY (Task_Id)
);
CREATE TABLE Employee (
Employee_Id int NOT NULL,
EmployeeName varchar(50) NOT NULL,
EmployeeSurname varchar(50),
Age int,
Department varchar(50),
CONSTRAINT Employee_PK PRIMARY KEY (Employee_Id)
);
CREATE TABLE TaskStatus (
TaskStatus_Id int NOT NULL,
TaskStatusName  varchar(50) NOT NULL,
IsActive  int,
CreatedAt  date,
UpdatedAt  date,
CONSTRAINT TaskStatus_PK PRIMARY KEY (TaskStatus_Id)
);

ALTER TABLE Task
ADD CONSTRAINT fk_TaskStatus
  FOREIGN KEY (TaskStatus_Id)
  REFERENCES TaskStatus(TaskStatus_Id);

ALTER TABLE Task
ADD CONSTRAINT fk_Employee
  FOREIGN KEY (EmployeeId)
  REFERENCES Employee(Employee_Id);
  
  

INSERT INTO "SYS"."TASKSTATUS" (TASKSTATUS_ID, TASKSTATUSNAME, ISACTIVE, CREATEDAT, UPDATEDAT) VALUES ('1', 'Publish Annual Profit & Loss Table', '0', TO_DATE('2020-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-02-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
INSERT INTO "SYS"."TASKSTATUS" (TASKSTATUS_ID, TASKSTATUSNAME, ISACTIVE, CREATEDAT, UPDATEDAT) VALUES ('2', 'Monthly Sales Performance Analysis', '1', TO_DATE('2020-11-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-11-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
INSERT INTO "SYS"."TASKSTATUS" (TASKSTATUS_ID, TASKSTATUSNAME, ISACTIVE, CREATEDAT, UPDATEDAT) VALUES ('3', 'Branch CRM Review', '1', TO_DATE('2020-11-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-11-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))

Commit


INSERT INTO "SYS"."EMPLOYEE" (EMPLOYEE_ID, EMPLOYEENAME, EMPLOYEESURNAME, AGE, DEPARTMENT) VALUES ('1', 'Umur', 'Islamoglu', '28', 'Sales')
INSERT INTO "SYS"."EMPLOYEE" (EMPLOYEE_ID, EMPLOYEENAME, EMPLOYEESURNAME, AGE, DEPARTMENT) VALUES ('2', 'Ide', 'Tug', '27', 'Finance')
INSERT INTO "SYS"."EMPLOYEE" (EMPLOYEE_ID, EMPLOYEENAME, EMPLOYEESURNAME, AGE, DEPARTMENT) VALUES ('3', 'Zeynep', 'Atmaca', '40', 'CRM')

Commit 



INSERT INTO "SYS"."TASK" (TASK_ID, TASKNAME, TASKSTATUS_ID, EMPLOYEEID, DEADLINE) VALUES ('1', 'Reporting Specialist', '1', '2', TO_DATE('2021-01-01 20:54:10', 'YYYY-MM-DD HH24:MI:SS'))
INSERT INTO "SYS"."TASK" (TASK_ID, TASKNAME, TASKSTATUS_ID, EMPLOYEEID, DEADLINE) VALUES ('2', 'CRM Specialist', '2', '3', TO_DATE('2020-12-15 20:55:14', 'YYYY-MM-DD HH24:MI:SS'))
INSERT INTO "SYS"."TASK" (TASK_ID, TASKNAME, TASKSTATUS_ID, EMPLOYEEID, DEADLINE) VALUES ('3', 'Sales Associate', '3', '1', TO_DATE('2020-12-01 20:56:10', 'YYYY-MM-DD HH24:MI:SS'))

Commit 

CREATE PUBLIC SYNONYM Task
FOR app.Task 

CREATE VIEW active_task AS
  SELECT task.taskname, taskstatus.taskstatusname,taskstatus.isactive,task.deadline
  FROM Task
  INNER JOIN TaskStatus
  ON task.taskstatus_id = taskstatus.taskstatus_id
  WHERE TaskStatus.IsActive <> 0


Select * from active_task
 
